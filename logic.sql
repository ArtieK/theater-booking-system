
-- Drop existing if reloaded
DROP FUNCTION IF EXISTS check_3_day_cutoff() CASCADE;
DROP FUNCTION IF EXISTS apply_dynamic_pricing() CASCADE;

-- 1. Function: Prevent booking if within 3 days of performance
CREATE OR REPLACE FUNCTION check_3_day_cutoff()
RETURNS TRIGGER AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM Performances p
    WHERE p.id = NEW.performance_id
      AND p.date_time - CURRENT_DATE < INTERVAL '3 days'
  ) THEN
    RAISE EXCEPTION 'Bookings must be made at least 3 days before the performance.';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: Enforce 3-day cutoff on booking insert
CREATE TRIGGER trg_check_3_day_cutoff
BEFORE INSERT ON Booking
FOR EACH ROW EXECUTE FUNCTION check_3_day_cutoff();


-- 2. Function: Automatically calculate final_price based on performance price_factor
-- assuming base ticket price is 20.00 unless free or discounted
CREATE OR REPLACE FUNCTION apply_dynamic_pricing()
RETURNS TRIGGER AS $$
DECLARE
  factor NUMERIC;
  base_price NUMERIC := 20.0;
BEGIN
  IF NEW.is_free THEN
    NEW.final_price := 0.0;
  ELSE
    SELECT price_factor INTO factor FROM Performances WHERE id = NEW.performance_id;
    IF NEW.is_discounted THEN
      NEW.final_price := base_price * factor * 0.8;
    ELSE
      NEW.final_price := base_price * factor;
    END IF;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: Set pricing before booking insert
CREATE TRIGGER trg_apply_pricing
BEFORE INSERT ON Booking
FOR EACH ROW EXECUTE FUNCTION apply_dynamic_pricing();
