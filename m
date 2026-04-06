Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C172D883F;
	Mon,  6 Apr 2026 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775494843; cv=none; b=W9C7hK0WaYq61WSotuXLqrDSmOeBPELgSh83VLu3gx4xzaoiw6/H2q/I+rIXpl4Yc7RWvh12gaPmolahhp5eM2rMWoo42HwCsTZVr7kC+i6akYu8fwoY/DzjYJbf1Rzk+V/88tzunPBc2+SpvmGG5eYWbFUg9BY0DPpvGg6M8MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775494843; c=relaxed/simple;
	bh=kELBbcQpmhJYF/hxMDc0iagdbtwtCl618DEcc9/nJiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XB+3z3K+j3bXUQf5R7Lhno24w68vag7sp9qWiQ3QZhPtxF9ArmcK7a0V2T8WZRv2ShhNyBAI+N2YbNGcXSA/jCa1j2T72CbfAENJEWAI1WsLX1zBrLwu6FWvjpJs97bd8oaEZPRK3J165AXjNvKRhXj5VRwFTofvfH5wzj2SMdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHltm8ol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHltm8ol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919DFC4CEF7;
	Mon,  6 Apr 2026 17:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775494843;
	bh=kELBbcQpmhJYF/hxMDc0iagdbtwtCl618DEcc9/nJiI=;
	h=From:To:Cc:Subject:Date:From;
	b=oHltm8ole8i/GhwniZLppBuUzP0TIr6kVGowXRj/tY8hZyUwzxY0zjMhxlG2/efDu
	 Y7Et2bSlWIFnELbVYgf8EypO3nnv8UMeKOWYS3jWfD6mbta1RwxpC6YKzj/OLNlLgw
	 qIQ+XK4BAmVykh7lREgNLs2KBlFR2JZgnJuo8w366HhTiN/37whSGMw62qg4eDrXDR
	 JLLbEhBlrzkupvXdGC5pL76DnheVhS2veiaVvkTwFu6n7UO5Y0/KYW1+3jVgv0Z8u3
	 6hGElTNq/ABSxg7dWNEX/IIJynRqJJnABQy79k966r5Z6IWgcHSuzXHQhyh/UfFy/D
	 KukrJ96THoNUg==
From: Sasha Levin <sashal@kernel.org>
To: dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com
Cc: joe@perches.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	apw@canonical.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] checkpatch: add --json output mode
Date: Mon,  6 Apr 2026 13:00:39 -0400
Message-ID: <20260406170039.4034716-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

The --json flag is mutually exclusive with --terse and --emacs.
Normal text output behavior is completely unchanged when --json is
not specified.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/dev-tools/checkpatch.rst |  7 +++
 scripts/checkpatch.pl                  | 86 ++++++++++++++++++++++++--
 2 files changed, 87 insertions(+), 6 deletions(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index dccede68698ca..17e5744d3dee6 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -64,6 +64,13 @@ Available options:
 
    Output only one line per report.
 
+ - --json
+
+   Output results as a JSON object.  The object includes total error, warning,
+   and check counts, plus an array of individual issues with structured fields
+   for level, type, message, file, and line number.  Cannot be used with
+   --terse or --emacs.
+
  - --showfile
 
    Show the diffed file position instead of the input file position.
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e56374662ff79..ed70753ba1afc 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -33,6 +33,7 @@ my $chk_patch = 1;
 my $tst_only;
 my $emacs = 0;
 my $terse = 0;
+my $json = 0;
 my $showfile = 0;
 my $file = 0;
 my $git = 0;
@@ -93,6 +94,7 @@ Options:
   --patch                    treat FILE as patchfile (default)
   --emacs                    emacs compile window format
   --terse                    one line per report
+  --json                     output results as JSON
   --showfile                 emit diffed file position, not input file position
   -g, --git                  treat FILE as a single commit or git revision range
                              single git commit with:
@@ -320,6 +322,7 @@ GetOptions(
 	'patch!'	=> \$chk_patch,
 	'emacs!'	=> \$emacs,
 	'terse!'	=> \$terse,
+	'json!'		=> \$json,
 	'showfile!'	=> \$showfile,
 	'f|file!'	=> \$file,
 	'g|git!'	=> \$git,
@@ -379,6 +382,7 @@ help($help - 1) if ($help);
 
 die "$P: --git cannot be used with --file or --fix\n" if ($git && ($file || $fix));
 die "$P: --verbose cannot be used with --terse\n" if ($verbose && $terse);
+die "$P: --json cannot be used with --terse or --emacs\n" if ($json && ($terse || $emacs));
 
 if ($color =~ /^[01]$/) {
 	$color = !$color;
@@ -1351,7 +1355,7 @@ for my $filename (@ARGV) {
 	}
 	close($FILE);
 
-	if ($#ARGV > 0 && $quiet == 0) {
+	if (!$json && $#ARGV > 0 && $quiet == 0) {
 		print '-' x length($vname) . "\n";
 		print "$vname\n";
 		print '-' x length($vname) . "\n";
@@ -1372,7 +1376,7 @@ for my $filename (@ARGV) {
 	$file = $oldfile if ($is_git_file);
 }
 
-if (!$quiet) {
+if (!$quiet && !$json) {
 	hash_show_words(\%use_type, "Used");
 	hash_show_words(\%ignore_type, "Ignored");
 
@@ -2395,6 +2399,18 @@ sub report {
 
 	push(our @report, $output);
 
+	if ($json) {
+		our ($realfile, $realline);
+		my %issue = (
+			level => $level,
+			type => $type,
+			message => $msg,
+		);
+		$issue{file} = $realfile if (defined $realfile && $realfile ne '');
+		$issue{line} = $realline + 0 if (defined $realline && $realline);
+		push(our @json_issues, \%issue);
+	}
+
 	return 1;
 }
 
@@ -2402,6 +2418,34 @@ sub report_dump {
 	our @report;
 }
 
+sub json_escape {
+	my ($str) = @_;
+	$str =~ s/\\/\\\\/g;
+	$str =~ s/"/\\"/g;
+	$str =~ s/\n/\\n/g;
+	$str =~ s/\r/\\r/g;
+	$str =~ s/\t/\\t/g;
+	$str =~ s/\x08/\\b/g;
+	$str =~ s/\x0c/\\f/g;
+	$str =~ s/([\x00-\x07\x0b\x0e-\x1f])/sprintf("\\u%04x", ord($1))/ge;
+	return $str;
+}
+
+sub json_encode_issue {
+	my ($issue) = @_;
+	my @fields;
+	push(@fields, '"level":"' . json_escape($issue->{level}) . '"');
+	push(@fields, '"type":"' . json_escape($issue->{type}) . '"');
+	push(@fields, '"message":"' . json_escape($issue->{message}) . '"');
+	if (defined $issue->{file}) {
+		push(@fields, '"file":"' . json_escape($issue->{file}) . '"');
+	}
+	if (defined $issue->{line}) {
+		push(@fields, '"line":' . ($issue->{line} + 0));
+	}
+	return '{' . join(',', @fields) . '}';
+}
+
 sub fixup_current_range {
 	my ($lineRef, $offset, $length) = @_;
 
@@ -2690,14 +2734,15 @@ sub process {
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
@@ -7791,18 +7836,33 @@ sub process {
 	# If we have no input at all, then there is nothing to report on
 	# so just keep quiet.
 	if ($#rawlines == -1) {
+		if ($json) {
+			print '{"filename":"' . json_escape($filename) .
+			      '","total_errors":0,"total_warnings":0,' .
+			      '"total_checks":0,"total_lines":0,"issues":[]}' . "\n";
+		}
 		exit(0);
 	}
 
 	# In mailback mode only produce a report in the negative, for
 	# things that appear to be patches.
 	if ($mailback && ($clean == 1 || !$is_patch)) {
+		if ($json) {
+			print '{"filename":"' . json_escape($filename) .
+			      '","total_errors":0,"total_warnings":0,' .
+			      '"total_checks":0,"total_lines":0,"issues":[]}' . "\n";
+		}
 		exit(0);
 	}
 
 	# This is not a patch, and we are in 'no-patch' mode so
 	# just keep quiet.
 	if (!$chk_patch && !$is_patch) {
+		if ($json) {
+			print '{"filename":"' . json_escape($filename) .
+			      '","total_errors":0,"total_warnings":0,' .
+			      '"total_checks":0,"total_lines":0,"issues":[]}' . "\n";
+		}
 		exit(0);
 	}
 
@@ -7850,6 +7910,19 @@ sub process {
 		}
 	}
 
+	if ($json) {
+		my @issue_strings;
+		foreach my $issue (@json_issues) {
+			push(@issue_strings, json_encode_issue($issue));
+		}
+		print '{"filename":"' . json_escape($filename) . '",' .
+		      '"total_errors":' . ($cnt_error + 0) . ',' .
+		      '"total_warnings":' . ($cnt_warn + 0) . ',' .
+		      '"total_checks":' . ($cnt_chk + 0) . ',' .
+		      '"total_lines":' . ($cnt_lines + 0) . ',' .
+		      '"issues":[' . join(',', @issue_strings) . ']' .
+		      '}' . "\n";
+	} else {
 	print report_dump();
 	if ($summary && !($clean == 1 && $quiet == 1)) {
 		print "$filename " if ($summary_file);
@@ -7878,8 +7951,9 @@ NOTE: Whitespace errors detected.
 EOM
 		}
 	}
+	} # end !$json
 
-	if ($clean == 0 && $fix &&
+	if (!$json && $clean == 0 && $fix &&
 	    ("@rawlines" ne "@fixed" ||
 	     $#fixed_inserted >= 0 || $#fixed_deleted >= 0)) {
 		my $newfile = $filename;
@@ -7918,7 +7992,7 @@ EOM
 		}
 	}
 
-	if ($quiet == 0) {
+	if (!$json && $quiet == 0) {
 		print "\n";
 		if ($clean == 1) {
 			print "$vname has no obvious style problems and is ready for submission.\n";
-- 
2.53.0

