mtdom(1..24).
role(xplayer).
role(oplayer).
role(zplayer).
base(cell(X51873, X51874, X51875)) :- x(X51873), y(X51874), role(X51875), domdomain(2, X51873), domdomain(2, X51874), domdomain(3, X51875).
base(control(xplayer)).
base(control(oplayer)).
base(control(zplayer)).
input(X51871, drop(X51874)) :- role(X51871), x(X51874), domdomain(3, X51871), domdomain(2, X51874).
input(X51871, noop) :- role(X51871), domdomain(3, X51871).
true(control(xplayer), 1).
legal(X51871, noop, X51886) :- role(X51871), not true(control(X51871), X51886), tdom(X51886), domdomain(3, X51871).
legal(X51871, drop(X51874), X51886) :- true(control(X51871), X51886), columnopen(X51874, X51886), tdom(X51886), domdomain(3, X51871), domdomain(2, X51874).
true(cell(X51873, 1, X51875), X51888 + 1) :- does(X51875, drop(X51873), X51888), columnempty(X51873, X51888), tdom(X51888), mtdom(X51888), domdomain(2, X51873), domdomain(3, X51875).
true(cell(X51873, X51874, X51875), X51901 + 1) :- does(X51875, drop(X51873), X51901), cellopen(X51873, X51874, X51901), succ(X51891, X51874), not cellopen(X51873, X51891, X51901), domdomain(2, X51891), domdomain(7, X51891), domdomain(8, X51874), tdom(X51901), mtdom(X51901), domdomain(2, X51873), domdomain(2, X51874), domdomain(3, X51875).
true(cell(X51873, X51874, X51875), X51885 + 1) :- true(cell(X51873, X51874, X51875), X51885), mtdom(X51885), domdomain(2, X51873), domdomain(2, X51874), domdomain(3, X51875).
true(control(xplayer), X51881 + 1) :- true(control(zplayer), X51881), mtdom(X51881).
true(control(zplayer), X51881 + 1) :- true(control(oplayer), X51881), mtdom(X51881).
true(control(oplayer), X51881 + 1) :- true(control(xplayer), X51881), mtdom(X51881).
terminal(X51875) :- line(xplayer, X51875), tdom(X51875).
terminal(X51875) :- line(oplayer, X51875), tdom(X51875).
terminal(X51875) :- line(zplayer, X51875), tdom(X51875).
terminal(X51875) :- not boardopen(X51875), tdom(X51875).
goal(X51871, 100, X51882) :- line(X51871, X51882), role(X51871), tdom(X51882), domdomain(3, X51871).
goal(xplayer, 100, X51896) :- not line(xplayer, X51896), not line(oplayer, X51896), not line(zplayer, X51896), not boardopen(X51896), tdom(X51896).
goal(oplayer, 0, X51896) :- not line(xplayer, X51896), not line(oplayer, X51896), not line(zplayer, X51896), not boardopen(X51896), tdom(X51896).
goal(zplayer, 0, X51896) :- not line(xplayer, X51896), not line(oplayer, X51896), not line(zplayer, X51896), not boardopen(X51896), tdom(X51896).
goal(xplayer, 0, X51878) :- line(oplayer, X51878), tdom(X51878).
goal(xplayer, 0, X51878) :- line(zplayer, X51878), tdom(X51878).
goal(oplayer, 0, X51878) :- line(xplayer, X51878), tdom(X51878).
goal(oplayer, 0, X51878) :- line(zplayer, X51878), tdom(X51878).
goal(zplayer, 0, X51878) :- line(xplayer, X51878), tdom(X51878).
goal(zplayer, 0, X51878) :- line(oplayer, X51878), tdom(X51878).
cellopen(X51871, X51872, X51912) :- x(X51871), y(X51872), not true(cell(X51871, X51872, xplayer), X51912), not true(cell(X51871, X51872, oplayer), X51912), not true(cell(X51871, X51872, zplayer), X51912), tdom(X51912), domdomain(2, X51871), domdomain(2, X51872).
columnopen(X51871, X51878) :- cellopen(X51871, 5, X51878), tdom(X51878), domdomain(2, X51871).
columnempty(X51871, X51878) :- cellopen(X51871, 1, X51878), tdom(X51878), domdomain(2, X51871).
boardopen(X51879) :- x(X51873), columnopen(X51873, X51879), domdomain(2, X51873), tdom(X51879).
line(X51871, X51920) :- true(cell(X51877, X51878, X51871), X51920), succ(X51877, X51884), succ(X51884, X51889), succ(X51889, X51894), true(cell(X51884, X51878, X51871), X51920), true(cell(X51889, X51878, X51871), X51920), true(cell(X51894, X51878, X51871), X51920), domdomain(2, X51894), domdomain(2, X51889), domdomain(2, X51884), domdomain(7, X51889), domdomain(8, X51894), domdomain(7, X51884), domdomain(8, X51889), domdomain(7, X51877), domdomain(8, X51884), domdomain(2, X51877), domdomain(2, X51878), tdom(X51920), domdomain(3, X51871).
line(X51871, X51920) :- true(cell(X51877, X51878, X51871), X51920), succ(X51878, X51884), succ(X51884, X51889), succ(X51889, X51894), true(cell(X51877, X51884, X51871), X51920), true(cell(X51877, X51889, X51871), X51920), true(cell(X51877, X51894, X51871), X51920), domdomain(2, X51894), domdomain(2, X51889), domdomain(2, X51884), domdomain(7, X51889), domdomain(8, X51894), domdomain(7, X51884), domdomain(8, X51889), domdomain(7, X51878), domdomain(8, X51884), domdomain(2, X51877), domdomain(2, X51878), tdom(X51920), domdomain(3, X51871).
line(X51871, X51935) :- true(cell(X51877, X51878, X51871), X51935), succ(X51877, X51884), succ(X51884, X51889), succ(X51889, X51894), succ(X51878, X51899), succ(X51899, X51904), succ(X51904, X51909), true(cell(X51884, X51899, X51871), X51935), true(cell(X51889, X51904, X51871), X51935), true(cell(X51894, X51909, X51871), X51935), domdomain(2, X51894), domdomain(2, X51909), domdomain(2, X51889), domdomain(2, X51904), domdomain(2, X51884), domdomain(2, X51899), domdomain(7, X51904), domdomain(8, X51909), domdomain(7, X51899), domdomain(8, X51904), domdomain(7, X51878), domdomain(8, X51899), domdomain(7, X51889), domdomain(8, X51894), domdomain(7, X51884), domdomain(8, X51889), domdomain(7, X51877), domdomain(8, X51884), domdomain(2, X51877), domdomain(2, X51878), tdom(X51935), domdomain(3, X51871).
line(X51871, X51935) :- true(cell(X51877, X51878, X51871), X51935), succ(X51877, X51884), succ(X51884, X51889), succ(X51889, X51894), succ(X51898, X51878), succ(X51903, X51898), succ(X51908, X51903), true(cell(X51884, X51898, X51871), X51935), true(cell(X51889, X51903, X51871), X51935), true(cell(X51894, X51908, X51871), X51935), domdomain(2, X51894), domdomain(2, X51908), domdomain(2, X51889), domdomain(2, X51903), domdomain(2, X51884), domdomain(2, X51898), domdomain(7, X51908), domdomain(8, X51903), domdomain(7, X51903), domdomain(8, X51898), domdomain(7, X51898), domdomain(8, X51878), domdomain(7, X51889), domdomain(8, X51894), domdomain(7, X51884), domdomain(8, X51889), domdomain(7, X51877), domdomain(8, X51884), domdomain(2, X51877), domdomain(2, X51878), tdom(X51935), domdomain(3, X51871).
succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(4, 5).
x(1).
x(2).
x(3).
x(4).
x(5).
y(1).
y(2).
y(3).
y(4).
y(5).
domdomain(1, cell).
domdomain(1, control).
domdomain(2, 1).
domdomain(2, 2).
domdomain(2, 3).
domdomain(2, 4).
domdomain(2, 5).
domdomain(3, oplayer).
domdomain(3, xplayer).
domdomain(3, zplayer).
domdomain(4, 0).
domdomain(4, 100).
domdomain(5, control).
domdomain(6, drop).
domdomain(6, noop).
domdomain(7, 1).
domdomain(7, 2).
domdomain(7, 3).
domdomain(7, 4).
domdomain(8, 2).
domdomain(8, 3).
domdomain(8, 4).
domdomain(8, 5).
