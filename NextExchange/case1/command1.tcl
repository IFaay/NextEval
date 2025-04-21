*begin "version 2025.0.0.24  4-21-2025  21:17:52"
*createstringarray 20 " 0 penalty value              0.00    0.00    0.80    1.00   10.00" \
  "  1 min length        1 1.0  10.000   9.000   4.000   2.000   1.000    1   59    0" \
  "  2 max length        1 1.0  10.000  12.000  15.000  20.000  30.000    0   39    1" \
  "  3 aspect ratio      1 1.0   1.000   2.000   4.400   5.000  10.000    0   41    2" \
  "  4 warpage           1 1.0   0.000   5.000  13.000  15.000  30.000    0   56    3" \
  "  5 max angle quad    1 1.0  90.000 110.000 134.000 140.000 160.000    0   28    4" \
  "  6 min angle quad    1 1.0  90.000  70.000  46.000  40.000  20.000    0   61    5" \
  "  7 max angle tria    1 1.0  60.000  80.000 112.000 120.000 150.000    0   19    6" \
  "  8 min angle tria    1 1.0  60.000  50.000  34.000  30.000  15.000    0   22    7" \
  "  9 skew              1 1.0   0.000  10.000  34.000  40.000  70.000    0   46    8" \
  " 10 jacobian          1 1.0   1.000   0.900   0.700   0.600   0.300    0   57    9" \
  " 11 chordal dev       0 1.0   0.000   0.300   0.800   1.000   2.000    0   29   10" \
  " 12 taper             1 1.0   0.000   0.200   0.500   0.600   0.900    0   53   11" \
  " 13 % of trias        1 1.0   0.000   6.000  10.000  15.000  20.000    0    0   -1" \
  " 14 QI color legend            32      32       7       6       3           3   -1" \
  " 15 time_step         0        10.000                       0.01            0   59   12" \
  " 16 area_skew         0        10.000                      0.500            0   39   13" \
  " 17 cell_squish       0        10.000                      0.600            0   53   14" \
  " 18 equi_skew         0        10.000                      0.600            0   34   15" \
  "   Global_solver -1"
*setqualitycriteria 1 20 0
*templatefileset "C:/Program Files/Altair/2025/hwdesktop/templates/feoutput/abaqus/standard.3d"
*menufilterset "*"
*menufilterdisable 
*setoption show_scale=0
*setscaleoption position=bottom
*viewset 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 10 10
*graphicfont 2
*menufont 2
*ME_CoreBehaviorAdjust "allowable_actions_policy=default"
*loaddefaultattributevaluesfromxml 
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 32
*elementtype 208 7
*elementtype 56 2
*createstringarray 1 "sets"
*setentitytypesupportedbynamepool 1 1
*createstringarray 1 "sets"
*setentitytypesupportedbynamepool 1 1
*setoption highlight-active_color=#feb317
*setoption highlight-glow_color=#feb317
*clearmarkall 1
*setoption topoedgecolor=0
*setoption topofacecolor=4
*deletemodel 
*setsubmodeltype "includes"
*displayimporterrors 1
*feinputpreserveincludefiles 
*start_batch_import 2
*createstringarray 11 "Abaqus " "Standard3D " "CREATE_ONE_COMP_ACROSS_INCLUDES " \
  "ASSIGNPROP_BYHMCOMMENTS " "CREATE_PART_HIERARCHY" "IMPORT_MATERIAL_METADATA" \
  "ENGINEERINGENTITIES " "CONTACTSURF_DISPLAY_SKIP " "LOADCOLS_DISPLAY_SKIP " \
  "SYSTCOLS_DISPLAY_SKIP " "SOLVERMASSES_DISPLAY_SKIP "
*feinputwithdata2 "\#abaqus\\abaqus" "C:/Users/yfsun/PycharmProjects/NextEval/NextExchange/case1/nle1xf3c.inp" 0 0 0 0 0 1 11 1 0
*end_batch_import 
*clearmarkall 1
*createentity results name="result1"
*setvalue results id=1 resultfiles= "C:/Users/yfsun/PycharmProjects/NextEval/NextExchange/case1/nle1xf3c.odb"
*setvalue results id=1 init=1
*setoption block_messages=1
*setoption block_messages=0
*setsimulationstep 1 2
*setoption current_simulation_id=1:2
*setsimulationstep 1 1
# Session ended at "4-21-2025  21:24:10"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
*do_markrejectclear 0
