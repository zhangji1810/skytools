\set ECHO off
\i pgq_ext.sql
\set ECHO all

--
-- test batch tracking
--
select pgq_ext.is_batch_done('c', 1);
select pgq_ext.set_batch_done('c', 1);
select pgq_ext.is_batch_done('c', 1);
select pgq_ext.set_batch_done('c', 1);
select pgq_ext.is_batch_done('c', 2);
select pgq_ext.set_batch_done('c', 2);

--
-- test event tracking
--
select pgq_ext.is_batch_done('c', 3);
select pgq_ext.is_event_done('c', 3, 101);
select pgq_ext.set_event_done('c', 3, 101);
select pgq_ext.is_event_done('c', 3, 101);
select pgq_ext.set_event_done('c', 3, 101);
select pgq_ext.set_batch_done('c', 3);
select * from pgq_ext.completed_event order by 1,2;

