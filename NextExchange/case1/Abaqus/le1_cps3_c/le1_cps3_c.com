from driverConstants import *
from driverExplicit import ExplicitAnalysis
import driverUtils, sys
options = {
    'SIMExt':'.sim',
    'ams':OFF,
    'analysisType':EXPLICIT,
    'applicationName':'analysis',
    'aqua':OFF,
    'beamSectGen':OFF,
    'biorid':OFF,
    'cavityTypes':[],
    'cavparallel':OFF,
    'complexFrequency':OFF,
    'contact':OFF,
    'cosimulation':OFF,
    'coupledProcedure':OFF,
    'cpus':1,
    'cse':OFF,
    'cyclicSymmetryModel':OFF,
    'directCyclic':OFF,
    'domains':1,
    'dsa':OFF,
    'dynStepSenseAdj':OFF,
    'dynamic':OFF,
    'excite':OFF,
    'externalField':OFF,
    'externalFieldCSEAux':OFF,
    'externalFieldExtList':['.sim', '.SMAManifest'],
    'externalFieldFiles':[],
    'externalFieldSimReader':None,
    'fieldImport':OFF,
    'filPrt':[],
    'fils':[],
    'finitesliding':OFF,
    'flexiblebody':OFF,
    'foundation':OFF,
    'freqSimReq':OFF,
    'geostatic':OFF,
    'heatTransfer':OFF,
    'impJobExpVars':{},
    'importJobList':[],
    'importSim':OFF,
    'importer':OFF,
    'importerParts':OFF,
    'includes':[],
    'initialConditionsFile':OFF,
    'input':'le1_cps3_c',
    'inputFormat':INP,
    'interactive':None,
    'interpolExtList':['.odb', '.sim', '.SMAManifest'],
    'job':'le1_cps3_c',
    'keyword_licenses':[],
    'lanczos':OFF,
    'libs':[],
    'magnetostatic':OFF,
    'massDiffusion':OFF,
    'materialresponse':OFF,
    'modifiedTet':OFF,
    'moldflowFiles':[],
    'moldflowMaterial':OFF,
    'mp_mode':THREADS,
    'multiphysics':OFF,
    'noDmpDirect':[],
    'noMultiHost':[],
    'noMultiHostElemLoop':[],
    'noStdParallel':[],
    'no_domain_check':1,
    'onestepinverse':OFF,
    'outputKeywords':ON,
    'parallel_odb':SINGLE,
    'parallel_restartfile':SINGLE,
    'parameterized':OFF,
    'partsAndAssemblies':OFF,
    'parval':OFF,
    'pgdHeatTransfer':OFF,
    'postOutput':OFF,
    'preDecomposition':ON,
    'restart':OFF,
    'restartEndStep':OFF,
    'restartIncrement':0,
    'restartStep':0,
    'restartWrite':ON,
    'rezone':OFF,
    'runCalculator':OFF,
    'simPack':OFF,
    'soils':OFF,
    'soliter':OFF,
    'solverTypes':['DIRECT'],
    'ssd':OFF,
    'ssdCheckOK':False,
    'staticNonlinear':OFF,
    'steadyStateTransport':OFF,
    'step':ON,
    'stepSenseAdj':OFF,
    'stressExtList':['.odb', '.sim', '.SMAManifest'],
    'subGen':OFF,
    'subGenLibs':[],
    'subGenResidual':OFF,
    'subGenTypes':[],
    'submodel':OFF,
    'substrLibDefs':OFF,
    'substructure':OFF,
    'symmetricModelGeneration':OFF,
    'tempNoInterpolExtList':['.fil', '.odb', '.sim', '.SMAManifest'],
    'thermal':OFF,
    'tmpdir':'C:\\Users\\yfsun\\AppData\\Local\\Temp',
    'tracer':OFF,
    'transientSensitivity':OFF,
    'unfold_param':OFF,
    'unsymm':OFF,
    'visco':OFF,
    'xplSelect':ON,
}
analysis = ExplicitAnalysis(options)
status = analysis.run()
sys.exit(status)
