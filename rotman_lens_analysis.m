% Microstrip and Rotman Lens Design Script
% Pouyan Keshavarzian
% June 2017 MSc Studies

clear all
close all
clc
theta = linspace(0,2*pi,5000);
% Load Constants
constants = load('constants.mat');
% Define input fields for the microstrip design
input = struct('Frequency', 2.4e9,'Height', 50, 'Width', 40, ...
    'copper_t', 1.4, 'Sub_epsr', 10.2, 'Sub_lsstan', 0.0023);
% create microstrip object instance
micro1 = MicrostripDesign(constants,input);
[Z_0,eps_eff,lambda_g, lambda_g_q, alpha_c, alpha_d] = ...
    calc_values(micro1,constants);

%% Simple Rotman Class Tests and AF Plotting
S(1,:,:) = [   -1.518647E-001 -    8.965061E-002i,    2.598402E-002 +    2.563287E-002i,   -1.224309E-001 +    6.674357E-002i,    1.370383E-001 -    3.772819E-002i,   -1.271577E-001 -    1.886089E-001i,   -2.139470E-001 +    1.661650E-001i,    1.474242E-001 +    3.344153E-001i,   -2.844717E-002 -    2.696242E-001i,    1.629623E-001 +    1.503395E-001i,   -1.681281E-001 +    2.950873E-002i,    1.536788E-001 -    4.847116E-002i,    2.048900E-001 +    2.383024E-001i,   -2.983452E-002 +    4.200591E-001i,   -2.965741E-001 +    1.033624E-001i;   2.598455E-002 +    2.563291E-002i,   -1.441825E-001 -    1.253790E-002i,    2.620042E-002 +    1.353518E-002i,   -1.311695E-001 +    6.049683E-002i,    1.774565E-001 +    5.957153E-002i,   -7.651159E-002 -    2.924851E-001i,   -2.526438E-001 +    1.525275E-001i,   -2.453797E-001 +    1.524558E-001i,   -8.922766E-002 -    2.821159E-001i,    1.794800E-001 +    4.491897E-002i,   -1.347826E-001 +    8.060354E-002i,    5.260217E-002 +    4.066646E-001i,    9.351399E-002 +    2.177250E-001i,    4.338870E-002 +    4.087427E-001i;  -1.224312E-001 +    6.674338E-002i,    2.620057E-002 +    1.353510E-002i,   -1.179571E-001 -    9.394993E-002i,    1.510491E-001 -    3.043746E-002i,   -1.680930E-001 +    2.383300E-002i,    1.521380E-001 +    1.644102E-001i,   -2.676123E-002 -    2.756073E-001i,    1.427741E-001 +    3.338509E-001i,   -2.021134E-001 +    1.806137E-001i,   -1.444317E-001 -    1.985677E-001i,    1.313795E-001 -    3.699203E-002i,   -2.934522E-001 +    1.072644E-001i,   -3.322692E-002 +    4.165131E-001i,    2.121152E-001 +    2.414444E-001i;   1.370389E-001 -    3.772870E-002i,   -1.311694E-001 +    6.049703E-002i,    1.510490E-001 -    3.043748E-002i,   -1.141717E-001 -    9.731404E-002i,    1.157765E-001 +    3.243005E-003i,   -1.458023E-001 -    5.648716E-002i,    3.159724E-002 +    1.421724E-001i,    2.500813E-001 +    1.506626E-001i,    1.387323E-001 +    2.931002E-001i,   -9.237044E-002 +    3.559858E-001i,   -2.562950E-001 -    2.416532E-001i,   -3.041411E-003 -    2.627105E-001i,   -2.757348E-001 +    4.535751E-002i,    9.963031E-002 +    3.546552E-001i;  -1.271565E-001 -    1.886089E-001i,    1.774570E-001 +    5.957201E-002i,   -1.680934E-001 +    2.383320E-002i,    1.157772E-001 +    3.243103E-003i,   -2.791739E-001 -    9.217249E-002i,    1.928412E-001 +    1.222829E-001i,   -1.563095E-001 -    1.752106E-002i,    1.597594E-001 +    3.126998E-001i,    1.246103E-001 +    1.082162E-001i,    1.721747E-001 +    2.814230E-001i,   -1.019545E-001 +    3.590356E-001i,    1.618255E-001 +    1.629356E-001i,   -2.013447E-002 -    2.800990E-001i,   -2.064504E-001 +    1.425310E-001i;  -2.139469E-001 +    1.661651E-001i,   -7.651155E-002 -    2.924849E-001i,    1.521379E-001 +    1.644105E-001i,   -1.458019E-001 -    5.648706E-002i,    1.928418E-001 +    1.222829E-001i,   -2.727041E-001 -    6.109106E-002i,    1.289862E-001 -    2.233971E-002i,   -1.255089E-001 +    3.058991E-001i,    1.728181E-001 +    3.327386E-001i,    1.263222E-001 +    1.081214E-001i,    1.325553E-001 +    2.937902E-001i,   -1.612640E-001 -    1.787479E-002i,    1.377641E-001 +    1.145381E-001i,   -1.132626E-001 -    2.127243E-001i;   1.474243E-001 +    3.344151E-001i,   -2.526442E-001 +    1.525273E-001i,   -2.676092E-002 -    2.756071E-001i,    3.159698E-002 +    1.421727E-001i,   -1.563105E-001 -    1.752111E-002i,    1.289858E-001 -    2.233995E-002i,   -9.464650E-002 -    9.492233E-002i,   -2.661834E-001 -    2.172725E-001i,   -1.222213E-001 +    3.112100E-001i,    1.639641E-001 +    3.123879E-001i,    2.556790E-001 +    1.488610E-001i,    1.473951E-001 +    1.640327E-003i,   -1.359542E-001 +    3.637039E-002i,    1.277171E-001 -    2.563233E-002i;  -2.844761E-002 -    2.696238E-001i,   -2.453798E-001 +    1.524559E-001i,    1.427741E-001 +    3.338505E-001i,    2.500812E-001 +    1.506630E-001i,    1.597601E-001 +    3.127000E-001i,   -1.255085E-001 +    3.058990E-001i,   -2.661837E-001 -    2.172722E-001i,   -1.323400E-001 -    1.013943E-001i,    1.254524E-001 -    1.344006E-002i,   -1.580930E-001 -    2.932810E-003i,    3.495671E-002 +    1.476725E-001i,    1.403645E-001 -    2.658468E-002i,   -1.337105E-001 +    2.136433E-002i,    1.564541E-001 +    1.116412E-002i;   1.629621E-001 +    1.503396E-001i,   -8.922776E-002 -    2.821157E-001i,   -2.021133E-001 +    1.806137E-001i,    1.387322E-001 +    2.931005E-001i,    1.246104E-001 +    1.082164E-001i,    1.728180E-001 +    3.327387E-001i,   -1.222212E-001 +    3.112099E-001i,    1.254526E-001 -    1.344034E-002i,   -2.746080E-001 -    2.820958E-002i,    2.077352E-001 +    1.038255E-001i,   -1.445831E-001 -    4.949294E-002i,   -1.174054E-001 -    2.036008E-001i,    1.408644E-001 +    1.274372E-001i,   -1.674237E-001 -    2.077113E-002i;  -1.681277E-001 +    2.950916E-002i,    1.794801E-001 +    4.491928E-002i,   -1.444318E-001 -    1.985677E-001i,   -9.237009E-002 +    3.559860E-001i,    1.721748E-001 +    2.814233E-001i,    1.263219E-001 +    1.081214E-001i,    1.639643E-001 +    3.123883E-001i,   -1.580929E-001 -    2.933406E-003i,    2.077354E-001 +    1.038255E-001i,   -2.592157E-001 -    5.119739E-002i,    1.099761E-001 -    4.749299E-003i,   -2.071045E-001 +    1.454799E-001i,   -2.807553E-002 -    2.924959E-001i,    1.600070E-001 +    1.657221E-001i;   1.536787E-001 -    4.847033E-002i,   -1.347832E-001 +    8.060366E-002i,    1.313794E-001 -    3.699215E-002i,   -2.562948E-001 -    2.416527E-001i,   -1.019547E-001 +    3.590358E-001i,    1.325552E-001 +    2.937898E-001i,    2.556789E-001 +    1.488616E-001i,    3.495667E-002 +    1.476723E-001i,   -1.445828E-001 -    4.949282E-002i,    1.099764E-001 -    4.749184E-003i,   -1.072004E-001 -    8.162943E-002i,    1.061555E-001 +    3.517673E-001i,   -2.634455E-001 +    4.705699E-002i,   -1.118942E-002 -    2.654550E-001i;   2.048899E-001 +    2.383025E-001i,    5.260168E-002 +    4.066642E-001i,   -2.934519E-001 +    1.072645E-001i,   -3.041931E-003 -    2.627103E-001i,    1.618245E-001 +    1.629348E-001i,   -1.612640E-001 -    1.787539E-002i,    1.473951E-001 +    1.640662E-003i,    1.403647E-001 -    2.658492E-002i,   -1.174055E-001 -    2.036009E-001i,   -2.071046E-001 +    1.454797E-001i,    1.061561E-001 +    3.517666E-001i,   -1.790605E-001 -    1.144791E-001i,    5.997978E-002 +    3.868945E-003i,   -1.422552E-001 +    8.761170E-002i;  -2.983462E-002 +    4.200585E-001i,    9.351425E-002 +    2.177245E-001i,   -3.322682E-002 +    4.165133E-001i,   -2.757348E-001 +    4.535743E-002i,   -2.013448E-002 -    2.800994E-001i,    1.377641E-001 +    1.145381E-001i,   -1.359543E-001 +    3.637027E-002i,   -1.337101E-001 +    2.136457E-002i,    1.408645E-001 +    1.274372E-001i,   -2.807548E-002 -    2.924962E-001i,   -2.634454E-001 +    4.705661E-002i,    5.998010E-002 +    3.868622E-003i,   -2.163918E-001 -    2.039276E-002i,    6.253314E-002 -    6.631015E-003i;  -2.965740E-001 +    1.033620E-001i,    4.338859E-002 +    4.087423E-001i,    2.121151E-001 +    2.414441E-001i,    9.963011E-002 +    3.546550E-001i,   -2.064506E-001 +    1.425310E-001i,   -1.132624E-001 -    2.127242E-001i,    1.277172E-001 -    2.563220E-002i,    1.564542E-001 +    1.116413E-002i,   -1.674236E-001 -    2.077109E-002i,    1.600067E-001 +    1.657222E-001i,   -1.118952E-002 -    2.654550E-001i,   -1.422551E-001 +    8.761165E-002i,    6.253331E-002 -    6.631088E-003i,   -1.414849E-001 -    1.058299E-001i];
S2(1,:,:) = [   -1.815751E-001 -    1.508203E-001i,    5.822302E-002 +    6.988579E-003i,   -9.206920E-002 +    2.179799E-002i,    3.665052E-002 +    6.515280E-002i,   -4.038225E-002 -    1.002321E-001i,   -1.524169E-002 -    2.434736E-001i,    2.895414E-001 -    1.516933E-001i,   -2.428032E-003 -    3.064217E-001i,    2.191591E-001 -    1.938566E-002i,   -4.540142E-002 +    8.918106E-002i,    1.722602E-004 +    5.670544E-003i,    3.736206E-001 +    1.665933E-001i,    1.387844E-002 +    4.128054E-001i,   -3.854526E-001 -    3.525252E-002i;   5.822302E-002 +    6.988579E-003i,   -2.208303E-001 -    9.709837E-003i,    5.370923E-002 +    1.125822E-002i,    7.056539E-003 -    3.617209E-002i,   -1.084575E-001 +    1.156568E-001i,   -1.425397E-002 +    2.113039E-001i,   -8.430704E-002 +    2.682857E-001i,   -8.362720E-002 +    2.526536E-001i,   -2.213398E-002 +    2.129986E-001i,   -1.015243E-001 +    1.024503E-001i,    7.608446E-003 -    5.014967E-002i,    2.643092E-002 +    4.218384E-001i,    1.564141E-001 +    3.980661E-001i,    1.392470E-002 +    4.298125E-001i;  -9.206920E-002 +    2.179799E-002i,    5.370923E-002 +    1.125822E-002i,   -2.318290E-001 -    1.290050E-001i,    1.557705E-002 +    3.077400E-002i,   -4.811032E-002 +    8.725206E-002i,    2.117467E-001 -    3.091368E-002i,   -6.529278E-003 -    2.959797E-001i,    2.898138E-001 -    1.554206E-001i,   -2.181972E-002 -    2.429660E-001i,   -3.933937E-002 -    1.019731E-001i,    4.758077E-002 +    6.738095E-002i,   -3.715848E-001 -    2.176279E-002i,    2.427447E-002 +    4.238931E-001i,    3.673050E-001 +    1.611006E-001i;   3.665052E-002 +    6.515280E-002i,    7.056539E-003 -    3.617209E-002i,    1.557705E-002 +    3.077400E-002i,   -1.828857E-001 -    1.318998E-001i,    1.561450E-001 -    1.579415E-001i,   -4.011366E-001 +    7.049561E-002i,    2.349513E-001 +    1.831039E-001i,   -1.789077E-001 -    1.974977E-001i,   -3.471841E-002 +    1.765364E-001i,   -9.523076E-002 +    1.998448E-001i,   -2.313007E-001 -    2.494719E-002i,   -6.358759E-002 -    2.684665E-001i,   -9.531170E-002 +    2.994379E-001i,    3.616711E-001 -    1.104222E-001i;  -4.038225E-002 -    1.002321E-001i,   -1.084575E-001 +    1.156568E-001i,   -4.811032E-002 +    8.725206E-002i,    1.561450E-001 -    1.579415E-001i,   -3.895304E-002 +    1.393291E-001i,    1.222272E-001 -    4.622403E-002i,   -2.285829E-001 +    3.452858E-002i,   -1.367265E-001 -    2.472751E-001i,    9.624127E-002 +    1.952776E-001i,    6.519258E-001 +    1.386934E-001i,   -9.392633E-002 +    1.908687E-001i,   -3.283107E-003 +    5.656252E-004i,   -1.978959E-001 +    5.047654E-002i,    8.452907E-002 +    5.003169E-002i;  -1.524169E-002 -    2.434736E-001i,   -1.425397E-002 +    2.113039E-001i,    2.117467E-001 -    3.091368E-002i,   -4.011366E-001 +    7.049561E-002i,    1.222272E-001 -    4.622403E-002i,   -2.398788E-001 +    3.857696E-003i,   -1.741906E-001 +    2.149450E-001i,    2.220842E-001 -    1.247864E-001i,   -6.696276E-002 -    4.422961E-001i,    1.077841E-001 +    1.926773E-001i,   -2.663419E-002 +    1.791709E-001i,   -7.268254E-002 +    9.216574E-002i,    8.423482E-002 -    8.595746E-003i,   -1.382454E-001 +    7.395900E-002i;   2.895414E-001 -    1.516933E-001i,   -8.430704E-002 +    2.682857E-001i,   -6.529278E-003 -    2.959797E-001i,    2.349513E-001 +    1.831039E-001i,   -2.285829E-001 +    3.452858E-002i,   -1.741906E-001 +    2.149450E-001i,   -2.327322E-001 -    3.386971E-002i,   -1.283689E-001 -    2.296445E-001i,    2.109874E-001 -    1.323576E-001i,   -1.316615E-001 -    2.445381E-001i,   -1.784983E-001 -    1.959961E-001i,    1.362533E-001 +    2.893927E-002i,   -5.110097E-002 +    7.669416E-003i,    1.064071E-001 -    9.892781E-002i;  -2.428032E-003 -    3.064217E-001i,   -8.362720E-002 +    2.526536E-001i,    2.898138E-001 -    1.554206E-001i,   -1.789077E-001 -    1.974977E-001i,   -1.367265E-001 -    2.472751E-001i,    2.220842E-001 -    1.247864E-001i,   -1.283689E-001 -    2.296445E-001i,   -2.209277E-001 -    4.908717E-002i,   -1.730539E-001 +    2.037963E-001i,   -2.366093E-001 +    3.235098E-002i,    2.390430E-001 +    1.861280E-001i,    9.711773E-002 -    8.522802E-002i,   -4.337623E-002 +    1.413474E-002i,    1.427373E-001 +    4.047053E-002i;   2.191591E-001 -    1.938566E-002i,   -2.213398E-002 +    2.129986E-001i,   -2.181972E-002 -    2.429660E-001i,   -3.471841E-002 +    1.765364E-001i,    9.624127E-002 +    1.952776E-001i,   -6.696276E-002 -    4.422961E-001i,    2.109874E-001 -    1.323576E-001i,   -1.730539E-001 +    2.037963E-001i,   -2.644782E-001 +    1.254405E-002i,    9.977293E-002 -    4.557282E-002i,   -4.056447E-001 +    6.464107E-002i,   -1.373284E-001 +    8.185826E-002i,    6.963651E-002 -    1.375334E-002i,   -6.960082E-002 +    8.181605E-002i;  -4.540142E-002 +    8.918106E-002i,   -1.015243E-001 +    1.024503E-001i,   -3.933937E-002 -    1.019731E-001i,   -9.523076E-002 +    1.998448E-001i,    6.519258E-001 +    1.386934E-001i,    1.077841E-001 +    1.926773E-001i,   -1.316615E-001 -    2.445381E-001i,   -2.366093E-001 +    3.235098E-002i,    9.977293E-002 -    4.557282E-002i,   -5.476948E-002 +    1.342892E-001i,    1.670640E-001 -    1.623124E-001i,    8.886057E-002 +    5.186442E-002i,   -1.877563E-001 +    5.676905E-002i,   -2.178999E-003 +    1.127958E-003i;   1.722602E-004 +    5.670544E-003i,    7.608446E-003 -    5.014967E-002i,    4.758077E-002 +    6.738095E-002i,   -2.313007E-001 -    2.494719E-002i,   -9.392633E-002 +    1.908687E-001i,   -2.663419E-002 +    1.791709E-001i,   -1.784983E-001 -    1.959961E-001i,    2.390430E-001 +    1.861280E-001i,   -4.056447E-001 +    6.464107E-002i,    1.670640E-001 -    1.623124E-001i,   -1.687409E-001 -    1.429498E-001i,    3.650578E-001 -    1.176422E-001i,   -8.313815E-002 +    2.867090E-001i,   -4.793507E-002 -    2.706637E-001i;   3.736206E-001 +    1.665933E-001i,    2.643092E-002 +    4.218384E-001i,   -3.715848E-001 -    2.176279E-002i,   -6.358759E-002 -    2.684665E-001i,   -3.283107E-003 +    5.656252E-004i,   -7.268254E-002 +    9.216574E-002i,    1.362533E-001 +    2.893927E-002i,    9.711773E-002 -    8.522802E-002i,   -1.373284E-001 +    8.185826E-002i,    8.886057E-002 +    5.186442E-002i,    3.650578E-001 -    1.176422E-001i,   -7.046922E-002 -    1.349600E-001i,    9.734931E-002 +    2.657158E-002i,   -2.392784E-001 +    2.873213E-002i;   1.387844E-002 +    4.128054E-001i,    1.564141E-001 +    3.980661E-001i,    2.427447E-002 +    4.238931E-001i,   -9.531170E-002 +    2.994379E-001i,   -1.978959E-001 +    5.047654E-002i,    8.423482E-002 -    8.595746E-003i,   -5.110097E-002 +    7.669416E-003i,   -4.337623E-002 +    1.413474E-002i,    6.963651E-002 -    1.375334E-002i,   -1.877563E-001 +    5.676905E-002i,   -8.313815E-002 +    2.867090E-001i,    9.734931E-002 +    2.657158E-002i,   -2.337766E-001 -    1.322384E-002i,    7.282257E-002 +    3.103047E-002i;  -3.854526E-001 -    3.525252E-002i,    1.392470E-002 +    4.298125E-001i,    3.673050E-001 +    1.611006E-001i,    3.616711E-001 -    1.104222E-001i,    8.452907E-002 +    5.003169E-002i,   -1.382454E-001 +    7.395900E-002i,    1.064071E-001 -    9.892781E-002i,    1.427373E-001 +    4.047053E-002i,   -6.960082E-002 +    8.181605E-002i,   -2.178999E-003 +    1.127958E-003i,   -4.793507E-002 -    2.706637E-001i,   -2.392784E-001 +    2.873213E-002i,    7.282257E-002 +    3.103047E-002i,   -8.400568E-002 -    1.011709E-001i];

rotmanparams = struct('Na', 3,'Nb', 3, 'Nd', 8, 'excited_port', 1, 'd', ... 
    0.58, 'alpha', 30, 'theta_t', 25, 'beta', 0.9, 'G', 4, 'W0', 2, ...
    'taper_a', 1);
rotman1 = RotmanDesign(rotmanparams, micro1);

[AF1] = calc_AF(rotman1, S);

figure;
polar(theta, AF1);


rotman2 = RotmanDesign(rotmanparams, micro1);
[AF2] = calc_AF(rotman2, S2);

figure;
polar(theta, AF2);

%% Rotman Lens Design Class Dev
clear all
close all
clc
theta = linspace(0,2*pi,5000);
% Load Constants
constants = load('constants.mat');
% Define input fields for the microstrip design
input = struct('Frequency',2.4e9,'Height', 50, 'Width', 40, ...
    'copper_t', 1.4, 'Sub_epsr', 10.2, 'Sub_lsstan', 0.0023);
% create microstrip object instance
micro2 = MicrostripDesign(constants,input);
[Z_0,eps_eff,lambda_g, lambda_g_q, alpha_c, alpha_d] = ...
    calc_values(micro2,constants);

% Define input fields for the rotman design
rotmanparams = struct('Na', 3,'Nb', 3, 'Nd', 8, 'excited_port', 1, 'd', ... 
    0.58, 'alpha', 30, 'theta_t', 25, 'beta', 0.9, 'G', 4, 'W0', 2, ...
    'taper_a', 1);
% calculate parameters for rotman lens
rotman3 = RotmanDesign(rotmanparams, micro2);
[a, b, c, w, xa, ya] = calc_dimensions(rotman3, micro2);
W_W0 = w*rotman3.F;
% calculate array contour based on rotman parameters
ABC = [xa(1) ya(1);xa(2) ya(2);xa(3) ya(3)];
[r,xcyc] = fit_circle_through_3_points(ABC);
% calculate beam contour based on rotman parameters
[rb, xcyc_b, xbyb, theta_r] = beam_contour(rotman3);

F = 0.0877;
x_l = -cos(30*pi/180) - xcyc_b(1);
theta_r = acos(abs(x_l/rb));

x1new = xcyc_b(1) - rb*cos(theta_r/3);
y1new = xcyc_b(2) + rb*sin(theta_r/3);
x2new = xcyc_b(1) - rb*cos(theta_r*2/3);
y2new = xcyc_b(2) + rb*sin(theta_r*2/3);
xnew = [x1new; x2new];
ynew = [y1new y2new];


hold on
% plot the phase centers of the ports
scatter(xa,ya);
scatter(xbyb(:,1),xbyb(:,2));
scatter(xnew,ynew);
% plot countours
th = 0:pi/50:2*pi;
xunit = r * cos(th) + xcyc(1);
yunit = r * sin(th) + xcyc(2);
h = plot(xunit, yunit);

th = 0:pi/50:2*pi;
xunit = rb * cos(th) + xcyc_b(1);
yunit = rb * sin(th) + xcyc_b(2);
h = plot(xunit, yunit);
hold off

%% More dev

clear all
close all
clc
theta = linspace(0,2*pi,5000);
% Load Constants
constants = load('constants.mat');
% Define input fields for the microstrip design
input = struct('Frequency',2.4e9,'Height', 50, 'Width', 40, ...
    'copper_t', 1.4, 'Sub_epsr', 10.5, 'Sub_lsstan', 0.0023);
% create microstrip object instance
micro3 = MicrostripDesign(constants,input);
[Z_0,eps_eff,lambda_g, lambda_g_q, alpha_c, alpha_d] = ...
    calc_values(micro3,constants);

% Define input fields for the rotman design
rotmanparams = struct('Na', 7,'Nb', 7, 'Nd', 8, 'excited_port', 1, 'd', ... 
    0.58, 'alpha', 30, 'theta_t', 25, 'beta', 0.9, 'G', 4, 'W0', 2, ...
    'taper_a', 1);

% calculate parameters for rotman lens
rotman4 = RotmanDesign(rotmanparams, micro3);
[a, b, c, w, xa, ya] = calc_dimensions(rotman4, micro3);
W_W0 = w*rotman4.F;
% calculate array contour based on rotman parameters
ABC = [xa(1) ya(1);xa(2) ya(2);xa(3) ya(3)];
[r,xcyc] = fit_circle_through_3_points(ABC);
% calculate beam contour based on rotman parameters
[rb, xcyc_b, xbyb, theta_r] = beam_contour(rotman4);
[xant_yant] = antenna_positions(rotman4, xa, w);
figure;
plotbeamcountour(rb,xcyc_b,xbyb);
hold on
scatter(xa,ya);
scatter(xant_yant(:,1),xant_yant(:,2));
legend('Beam Port Phase Centres', 'Beam Port Contour', ...
    'Array Port Phase Centres', 'Antenna Postitions');
xlabel('Normalized x coordinates with respect to F')
ylabel('Normalized y coordinates with respect to F')
title('Array Port and Beam Port Normalized Phase Centres')
hold off
close all



% Plot unnormalized 
Rb = rotman4.F*rb;
XCYC_b = rotman4.F*xcyc_b;
XBYB = rotman4.F*xbyb;
Xa = rotman4.F*xa';
Ya = rotman4.F*ya';
Xant = rotman4.F*xant_yant(:,1);
Yant = rotman4.F*xant_yant(:,2);

figure;
plotbeamcountour(Rb*1000,XCYC_b*1000,XBYB*1000);
hold on
grid on
scatter(Xa*1000,Ya*1000);
scatter(Xant*1000,Yant*1000);
legend('Beam Port Phase Centres', 'Beam Port Contour', ... 
    'Array Port Phase Centres', 'Antenna Positions');
xlabel('X Coordinate of Rotman Lens (mm)')
ylabel('Y Coordinates of Rotman Lens (mm)')
title('Array Port and Beam Port Phase Centres')
hold off

% Create array for coordinates. No dummy ports yet just parallel plate
% region

X = [Xa; XBYB(:,1)]*1000;
Y = [Ya; XBYB(:,2)]*1000;

out = [X,Y];
save('RL_coordinates.mat','X','Y')
save RL_XY_coordinates_in_mm.tab out  -ascii

DATA = dlmread('RL_XY_coordinates_in_mm.tab');
N = size(DATA,1)/2;
X=DATA(:,1);
Y=DATA(:,2);
Z=zeros(N,1);
%% New transistor working at 2G..


clear all
close all
clc
theta = linspace(0,2*pi,5000);
% Load Constants
constants = load('constants.mat');
% Define input fields for the microstrip design
input = struct('Frequency',2.4e9,'Height', 50, 'Width', 40, ...
    'copper_t', 1.4, 'Sub_epsr', 10.2, 'Sub_lsstan', 0.0023);
% create microstrip object instance
micro1 = MicrostripDesign(constants,input);
[Z_0,eps_eff,lambda_g, lambda_g_q, alpha_c, alpha_d] = ...
    calc_values(micro1,constants);

% Define input fields for the rotman design
rotmanparams = struct('Na', 3,'Nb', 3, 'Nd', 8, 'excited_port', 1, 'd', ... 
    0.58, 'alpha', 30, 'theta_t', 25, 'beta', 0.9, 'G', 4, 'W0', 2, ...
    'taper_a', 1);
