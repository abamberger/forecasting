CREATE OR REPLACE FUNCTION insertfield(mid int, newname varchar(100)) RETURNS int LANGUAGE plpgsql AS $$
DECLARE
  rval int;
  BEGIN
    IF EXISTS (SELECT 1 from fields where fields.modelid = mid and fields.name = newname) THEN
        select INTO rval fieldid from fields where fields.modelid = mid and  fields.name = newname;
      ELSE
          INSERT into fields (modelid,name) values (mid,newname) returning fieldid into rval;
    END IF;
    return rval;
  END;
  $$;

