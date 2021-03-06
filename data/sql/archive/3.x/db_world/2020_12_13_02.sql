-- DB update 2020_12_13_01 -> 2020_12_13_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2020_12_13_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2020_12_13_01 2020_12_13_02 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1606911497462342200'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1606911497462342200');

/* Improve Great Hexer Ohodo pathing in Dalaran Bank. */

DELETE FROM `waypoint_data` WHERE `id` = 286860;
INSERT INTO `waypoint_data` VALUES 
(286860,  1, 5957.30, 617.082, 650.627, 0,     0, 0, 0, 100, 0),
(286860,  2, 5939.47, 628.060, 650.635, 0,     0, 0, 0, 100, 0),
(286860,  3, 5927.55, 634.656, 645.687, 0,     0, 0, 0, 100, 0),
(286860,  4, 5894.47, 657.878, 644.689, 0,     0, 0, 0, 100, 0),
(286860,  5, 5823.08, 714.962, 641.067, 0,     0, 0, 0, 100, 0),
(286860,  6, 5799.79, 719.503, 640.662, 0,     0, 0, 0, 100, 0),
(286860,  7, 5770.59, 703.947, 641.474, 0,     0, 0, 0, 100, 0),
(286860,  8, 5728.68, 659.603, 645.875, 0,     0, 0, 0, 100, 0),
(286860,  9, 5716.13, 657.986, 646.208, 0,     0, 0, 0, 100, 0),
(286860, 10, 5701.29, 654.542, 646.278, 0,     0, 0, 0, 100, 0),
(286860, 11, 5697.02, 648.178, 646.409, 0,     0, 0, 0, 100, 0),
(286860, 12, 5728.72, 617.990, 647.119, 0,     0, 0, 0, 100, 0),
(286860, 13, 5764.29, 595.154, 649.795, 0,     0, 0, 0, 100, 0),
(286860, 14, 5771.40, 598.778, 650.300, 0,     0, 0, 0, 100, 0),
(286860, 15, 5798.37, 631.355, 647.415, 0, 20000, 0, 0, 100, 0),
(286860, 16, 5809.01, 632.436, 647.466, 0,     0, 0, 0, 100, 0),
(286860, 17, 5813.84, 639.437, 647.445, 0,     0, 0, 0, 100, 0),
(286860, 18, 5812.63, 647.709, 647.412, 0,     0, 0, 0, 100, 0),
(286860, 19, 5837.74, 679.004, 643.481, 0,     0, 0, 0, 100, 0),
(286860, 20, 5863.23, 672.251, 644.026, 0,     0, 0, 0, 100, 0),
(286860, 21, 5872.09, 660.964, 644.640, 0,     0, 0, 0, 100, 0),
(286860, 22, 5871.88, 655.303, 645.210, 0,     0, 0, 0, 100, 0),
(286860, 23, 5866.63, 656.807, 645.358, 0,     0, 0, 0, 100, 0),
(286860, 24, 5858.62, 665.766, 647.508, 0,     0, 0, 0, 100, 0),
(286860, 25, 5854.41, 663.378, 647.492, 0,     0, 0, 0, 100, 0),
(286860, 26, 5853.32, 646.057, 647.512, 0,     0, 0, 0, 100, 0),
(286860, 27, 5855.31, 646.037, 647.512, 0, 20000, 0, 0, 100, 0),
(286860, 28, 5853.80, 644.893, 647.512, 0,     0, 0, 0, 100, 0),
(286860, 29, 5854.40, 639.586, 647.512, 0,     0, 0, 0, 100, 0),
(286860, 30, 5861.34, 632.159, 647.913, 0,     0, 0, 0, 100, 0),
(286860, 31, 5873.93, 637.614, 646.993, 0,     0, 0, 0, 100, 0),
(286860, 32, 5888.60, 639.829, 646.219, 0,     0, 0, 0, 100, 0),
(286860, 33, 5911.43, 634.141, 645.621, 0,     0, 0, 0, 100, 0),
(286860, 34, 5924.55, 626.764, 645.953, 0,     0, 0, 0, 100, 0),
(286860, 35, 5937.59, 622.716, 650.655, 0,     0, 0, 0, 100, 0),
(286860, 36, 5950.11, 618.000, 650.636, 0,     0, 0, 0, 100, 0),
(286860, 37, 5958.65, 608.832, 650.627, 0,     0, 0, 0, 100, 0),
(286860, 38, 5960.95, 598.314, 650.627, 0,     0, 0, 0, 100, 0),
(286860, 39, 5960.60, 597.760, 650.627, 0, 20000, 0, 0, 100, 0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
