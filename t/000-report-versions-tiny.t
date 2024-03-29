use strict;
use warnings;
use Test::More 0.88;
# This is a relatively nice way to avoid Test::NoWarnings breaking our
# expectations by adding extra tests, without using no_plan.  It also helps
# avoid any other test module that feels introducing random tests, or even
# test plans, is a nice idea.
our $success = 0;
END { $success && done_testing; }

# List our own version used to generate this
my $v = "\nGenerated by Dist::Zilla::Plugin::ReportVersions::Tiny v1.10\n";

eval {                     # no excuses!
    # report our Perl details
    my $want = '5.008';
    $v .= "perl: $] (wanted $want) on $^O from $^X\n\n";
};
defined($@) and diag("$@");

# Now, our module version dependencies:
sub pmver {
    my ($module, $wanted) = @_;
    $wanted = " (want $wanted)";
    my $pmver;
    eval "require $module;";
    if ($@) {
        if ($@ =~ m/Can't locate .* in \@INC/) {
            $pmver = 'module not found.';
        } else {
            diag("${module}: $@");
            $pmver = 'died during require.';
        }
    } else {
        my $version;
        eval { $version = $module->VERSION; };
        if ($@) {
            diag("${module}: $@");
            $pmver = 'died during VERSION check.';
        } elsif (defined $version) {
            $pmver = "$version";
        } else {
            $pmver = '<undef>';
        }
    }

    # So, we should be good, right?
    return sprintf('%-45s => %-10s%-15s%s', $module, $pmver, $wanted, "\n");
}

eval { $v .= pmver('Class::MOP','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::AutoPrereqs','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Bugtracker','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::CheckChangeLog','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Covenant','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::ExecDir','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::ExtraTests','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::GatherDir','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Git::Check','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Git::Commit','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Git::NextVersion','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Git::Push','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Git::Tag','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::HelpWanted','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Homepage','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::License','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Manifest','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::ManifestSkip','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::MetaConfig','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::MetaJSON','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::MetaProvides::Package','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::MetaYAML','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::ModuleBuild','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::NextRelease','2.101230') };
eval { $v .= pmver('Dist::Zilla::Plugin::PkgVersion','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::PodCoverageTests','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::PodSyntaxTests','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::PodWeaver','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Prepender','1.100130') };
eval { $v .= pmver('Dist::Zilla::Plugin::PruneCruft','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::PruneFiles','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Readme','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::ReadmeMarkdownFromPod','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::ReportVersions::Tiny','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Repository','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::ShareDir','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::TaskWeaver','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Test::Compile','1.100220') };
eval { $v .= pmver('Dist::Zilla::Plugin::TestRelease','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::UploadToCPAN','any version') };
eval { $v .= pmver('Dist::Zilla::Role::PluginBundle','any version') };
eval { $v .= pmver('Dist::Zilla::Role::PluginBundle::Config::Slicer','any version') };
eval { $v .= pmver('File::Spec','any version') };
eval { $v .= pmver('IO::Handle','any version') };
eval { $v .= pmver('IPC::Open3','any version') };
eval { $v .= pmver('Module::Build','0.3601') };
eval { $v .= pmver('Moose','any version') };
eval { $v .= pmver('Moose::Autobox','any version') };
eval { $v .= pmver('Test::More','0.88') };
eval { $v .= pmver('strict','any version') };
eval { $v .= pmver('warnings','any version') };


# All done.
$v .= <<'EOT';

Thanks for using my code.  I hope it works for you.
If not, please try and include this output in the bug report.
That will help me reproduce the issue and solve your problem.

EOT

diag($v);
ok(1, "we really didn't test anything, just reporting data");
$success = 1;

# Work around another nasty module on CPAN. :/
no warnings 'once';
$Template::Test::NO_FLUSH = 1;
exit 0;
