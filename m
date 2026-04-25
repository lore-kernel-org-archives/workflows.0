Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC88321A447;
	Sat, 25 Apr 2026 20:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777147475; cv=none; b=sePJo9uxDD7G/5eFyQTRBad0D0bLAnuzbPGp6xto2nS/l10lbOYkOKEyeOdChRP8CLb0/EAe5CjqyUNqJjSZDe55tsl7tRmmFI2WUYLDRwXkfH4ydKFgHfHbJ7KCosTVU7w/XGEiXV7qqzr5XKHgWAYl6UaKNc2lD1DzzEoiu2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777147475; c=relaxed/simple;
	bh=9RLIbxcunpDzr0V2hqKhDMcuMG4WL4EBA/dGSGfwb50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=irHb/2VkKe3wHOVQrGQP+qvhXWJ2ZmizbS3g54DQaNOlWikxeJdOF/hKxrxJEgY0qV4UtTRVZu7EjCeVvens8UbZXH/4ZeNy9fVBsR68VpWJpOBM0mC2IDq7u2o/AqcvXR8jNFF4t76HXr8U5XkErmXz3iBSfcMZLtqe9SmSTDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKtHOcHm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKtHOcHm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E12BC2BCB0;
	Sat, 25 Apr 2026 20:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777147474;
	bh=9RLIbxcunpDzr0V2hqKhDMcuMG4WL4EBA/dGSGfwb50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hKtHOcHm+uLxExynTV6xkjBllMoizFLKRc+W9ZSv9o9xmLKxK67kounbchl7GoR+g
	 lBXY00rVnkFTTx5m9vr/pBljYeejgXZ0n1cs7Hfs5EqvuT0lGk9QiWsrUoWcStySmZ
	 WPanjMfXk+qJO00Mns9iOs8krTG+4s0dJcAHcNhEfhce56KZ0k9p6NGJDlNgxjT4M2
	 78wFPquu/YzGnzieYaBYwiYFrjLuW3qJUa+40dHWwN9FaQhGRsYUYJ4N/xo4f1PLFf
	 svl+j9Aa983RXNbvWT0WmlFRct8FTByc/ZbHXQ6NVX2dNrUXq4ZoRGRgYG16DMbA0o
	 8ONV6Dritj9+w==
From: Sasha Levin <sashal@kernel.org>
To: dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com
Cc: joe@perches.com,
	mricon@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	apw@canonical.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v3] checkpatch: add --json output mode
Date: Sat, 25 Apr 2026 16:04:31 -0400
Message-ID: <20260425200431.4088895-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408172435.1268067-1-sashal@kernel.org>
References: <20260408172435.1268067-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a --json flag to checkpatch.pl that emits structured JSON output,
making results machine-parseable for CI systems, IDE integrations, and
AI-assisted code review tools.

The JSON output includes per-file totals (errors, warnings, checks,
lines) and an array of individual issues with structured fields for
level, type, message, file path, and line number.

A separate --json-pretty flag emits the same JSON in a pretty-printed
(indented, multi-line) form for human reading.

The --json (and --json-pretty) flags are mutually exclusive with
--terse and --emacs.  Normal text output behaviour is completely
unchanged when --json is not specified.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
v3:
  - Report the same line numbers text mode prints (matches --emacs
    and --showfile).  Fixes wrong locations on commit-message issues.
  - Drop redundant defined() checks and `+ 0` coercions in the JSON
    code; the values are already numeric and always defined.
  - Add --json-pretty for indented output.
  - Add parens around print() arguments.
  - Consolidate the three empty-result early exits into one block.
  - Return at the JSON branch instead of wrapping the rest of
    process() in an else, so multi-file runs emit one document per
    file and the indentation is no longer misleading.
v2: https://lore.kernel.org/all/20260408172435.1268067-1-sashal@kernel.org/
v1: https://lore.kernel.org/all/20260406170039.4034716-1-sashal@kernel.org/

 Documentation/dev-tools/checkpatch.rst | 13 ++++
 scripts/checkpatch.pl                  | 86 +++++++++++++++++++-------
 2 files changed, 78 insertions(+), 21 deletions(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index dccede68698ca..8a7c7742b23fa 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -64,6 +64,19 @@ Available options:
 
    Output only one line per report.
 
+ - --json
+
+   Output results as a JSON object.  The object includes total error,
+   warning, and check counts, plus an array of individual issues with
+   structured fields for level, type, message, file, and line number.
+   Output is one compact JSON document per input file, suitable for CI
+   and scripted post-processing.  Cannot be used with --terse or --emacs.
+
+ - --json-pretty
+
+   Like --json, but emit pretty-printed (indented, multi-line) JSON for
+   human reading.
+
  - --showfile
 
    Show the diffed file position instead of the input file position.
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0492d6afc9a1f..181bd10b046b7 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -14,6 +14,7 @@ use File::Basename;
 use Cwd 'abs_path';
 use Term::ANSIColor qw(:constants);
 use Encode qw(decode encode);
+use JSON::PP;
 
 my $P = $0;
 my $D = dirname(abs_path($P));
@@ -33,6 +34,8 @@ my $chk_patch = 1;
 my $tst_only;
 my $emacs = 0;
 my $terse = 0;
+my $json = 0;
+my $json_pretty = 0;
 my $showfile = 0;
 my $file = 0;
 my $git = 0;
@@ -93,6 +96,8 @@ Options:
   --patch                    treat FILE as patchfile (default)
   --emacs                    emacs compile window format
   --terse                    one line per report
+  --json                     output results as JSON
+  --json-pretty              like --json, but pretty-printed
   --showfile                 emit diffed file position, not input file position
   -g, --git                  treat FILE as a single commit or git revision range
                              single git commit with:
@@ -320,6 +325,8 @@ GetOptions(
 	'patch!'	=> \$chk_patch,
 	'emacs!'	=> \$emacs,
 	'terse!'	=> \$terse,
+	'json!'		=> \$json,
+	'json-pretty!'	=> \$json_pretty,
 	'showfile!'	=> \$showfile,
 	'f|file!'	=> \$file,
 	'g|git!'	=> \$git,
@@ -380,6 +387,9 @@ help($help - 1) if ($help);
 die "$P: --git cannot be used with --file or --fix\n" if ($git && ($file || $fix));
 die "$P: --verbose cannot be used with --terse\n" if ($verbose && $terse);
 
+$json = 1 if ($json_pretty);
+die "$P: --json cannot be used with --terse or --emacs\n" if ($json && ($terse || $emacs));
+
 if ($color =~ /^[01]$/) {
 	$color = !$color;
 } elsif ($color =~ /^always$/i) {
@@ -1352,7 +1362,7 @@ for my $filename (@ARGV) {
 	}
 	close($FILE);
 
-	if ($#ARGV > 0 && $quiet == 0) {
+	if (!$json && $#ARGV > 0 && $quiet == 0) {
 		print '-' x length($vname) . "\n";
 		print "$vname\n";
 		print '-' x length($vname) . "\n";
@@ -1373,7 +1383,7 @@ for my $filename (@ARGV) {
 	$file = $oldfile if ($is_git_file);
 }
 
-if (!$quiet) {
+if (!$quiet && !$json) {
 	hash_show_words(\%use_type, "Used");
 	hash_show_words(\%ignore_type, "Ignored");
 
@@ -2396,6 +2406,19 @@ sub report {
 
 	push(our @report, $output);
 
+	if ($json) {
+		our ($realfile, $realline, $linenr);
+		my $line = ($file || $showfile) ? $realline : $linenr;
+		my %issue = (
+			level   => $level,
+			type    => $type,
+			message => $msg,
+		);
+		$issue{file} = $realfile if ($realfile ne '');
+		$issue{line} = $line if ($line);
+		push(our @json_issues, \%issue);
+	}
+
 	return 1;
 }
 
@@ -2403,6 +2426,24 @@ sub report_dump {
 	our @report;
 }
 
+sub json_print_result {
+	my ($filename, $total_errors, $total_warnings, $total_checks,
+	    $total_lines, $issues, $used_types, $ignored_types) = @_;
+	my %result = (
+		filename       => $filename,
+		total_errors   => $total_errors,
+		total_warnings => $total_warnings,
+		total_checks   => $total_checks,
+		total_lines    => $total_lines,
+		issues         => $issues,
+	);
+	$result{used_types}    = $used_types    if (defined $used_types);
+	$result{ignored_types} = $ignored_types if (defined $ignored_types);
+	my $json_encoder = JSON::PP->new->canonical->utf8;
+	$json_encoder->pretty if ($json_pretty);
+	print($json_encoder->encode(\%result), "\n");
+}
+
 sub fixup_current_range {
 	my ($lineRef, $offset, $length) = @_;
 
@@ -2653,7 +2694,7 @@ sub is_userspace {
 sub process {
 	my $filename = shift;
 
-	my $linenr=0;
+	our $linenr=0;
 	my $prevline="";
 	my $prevrawline="";
 	my $stashline="";
@@ -2691,14 +2732,15 @@ sub process {
 	my $last_coalesced_string_linenr = -1;
 
 	our @report = ();
+	our @json_issues = ();
 	our $cnt_lines = 0;
 	our $cnt_error = 0;
 	our $cnt_warn = 0;
 	our $cnt_chk = 0;
 
 	# Trace the real file/line as we go.
-	my $realfile = '';
-	my $realline = 0;
+	our $realfile = '';
+	our $realline = 0;
 	my $realcnt = 0;
 	my $here = '';
 	my $context_function;		#undef'd unless there's a known function
@@ -7806,21 +7848,14 @@ sub process {
 		}
 	}
 
-	# If we have no input at all, then there is nothing to report on
-	# so just keep quiet.
-	if ($#rawlines == -1) {
-		exit(0);
-	}
-
-	# In mailback mode only produce a report in the negative, for
-	# things that appear to be patches.
-	if ($mailback && ($clean == 1 || !$is_patch)) {
-		exit(0);
-	}
-
-	# This is not a patch, and we are in 'no-patch' mode so
-	# just keep quiet.
-	if (!$chk_patch && !$is_patch) {
+	# Bail out early without producing a normal report when there is no
+	# input at all, when we are in mailback mode and either the patch is
+	# clean or the input does not appear to be a patch, or when the input
+	# is not a patch and we are in 'no-patch' mode.
+	if ($#rawlines == -1 ||
+	    ($mailback && ($clean == 1 || !$is_patch)) ||
+	    (!$chk_patch && !$is_patch)) {
+		json_print_result($filename, 0, 0, 0, 0, []) if ($json);
 		exit(0);
 	}
 
@@ -7868,7 +7903,16 @@ sub process {
 		}
 	}
 
-	print report_dump();
+	if ($json) {
+		my @used    = sort keys %use_type;
+		my @ignored = sort keys %ignore_type;
+		json_print_result($filename, $cnt_error, $cnt_warn,
+				  $cnt_chk, $cnt_lines, \@json_issues,
+				  \@used, \@ignored);
+		return $clean;
+	}
+
+	print(report_dump());
 	if ($summary && !($clean == 1 && $quiet == 1)) {
 		print "$filename " if ($summary_file);
 		print "total: $cnt_error errors, $cnt_warn warnings, " .
-- 
2.53.0

