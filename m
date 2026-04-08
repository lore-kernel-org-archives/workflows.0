Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BDC3D413C;
	Wed,  8 Apr 2026 17:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669078; cv=none; b=HIspdDmdoS4gbC0/xF7n+cDF3f8Nn5CUe5FIlie+dBH4YuJKzgycGHkHKLknOk7A5YFd10PCORmEKrglArhjtYaKxRY/h1VYuU5luDr2ATTjBVnza0oovTWHRd5YBLI6bSKCcHjVDFCntA9TPn+2FqfAI3fnEVbwVDbczpba9BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669078; c=relaxed/simple;
	bh=Rv8EVELx+/zidCVReIS8RYxmzUCqJs5h4jhRfn9SOb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prKJNuo4sYft43Mbvh/8brRpecEODnYVzh8wT1V276llGoiszB84cxLzbiwFmZ1OtwpsBRe5rVR9f6h0mBF2Iv9DTAZ7TVjh8ixLTfepGUTQP+zjiYZBHln5JsYnAs16H3Ro51ce+rTNK10lfCNx8TQ7YzkIhun1nfj7hOAuUyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdqwYCP1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdqwYCP1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A82C19421;
	Wed,  8 Apr 2026 17:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775669077;
	bh=Rv8EVELx+/zidCVReIS8RYxmzUCqJs5h4jhRfn9SOb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bdqwYCP1iEkSg2bTnuIKs13u6lHNjnomimU2YySnagiZkc8+HrbX30imbI46ef/YE
	 faHmFWBb05om2DBFJ2LraFWfIhM/A49kwjt3KG1KRvZQuxjPOXvlJQUUCsg3ullmT8
	 OGD6JOUqt9u5clIgQHrZz4SsKsjSuR0Ei4nSp+EvZQhnjXMaMR8AVjh5/wgO2FCPtm
	 Ni1Obk6tded+XatO1PvtZw5D+OF1AGKwRjeQaX7SjKJxwOnGpWtehRW2Yea1X5T/8p
	 09zRNztb0BnFQ9d59oZnSIX1S600fwmL9pTxl/435sum6ke3Er11N1BuemjutJgZSi
	 UTxXa/UQQvRKA==
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
Subject: [PATCH v2] checkpatch: add --json output mode
Date: Wed,  8 Apr 2026 13:24:35 -0400
Message-ID: <20260408172435.1268067-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406170039.4034716-1-sashal@kernel.org>
References: <20260406170039.4034716-1-sashal@kernel.org>
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
Changes since v1:
- Replace hand-rolled json_escape()/json_encode_issue() with JSON::PP
  module (core since perl 5.14), as suggested by Konstantin and Joe
- Factor duplicated empty-result JSON blocks into json_print_result()
  helper
- Include used_types and ignored_types arrays in JSON output instead of
  suppressing hash_show_words, per Joe's suggestion
---
 Documentation/dev-tools/checkpatch.rst |  7 +++
 scripts/checkpatch.pl                  | 64 +++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 6 deletions(-)

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
index e56374662ff79..38d1a4a13ee8e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -14,6 +14,7 @@ use File::Basename;
 use Cwd 'abs_path';
 use Term::ANSIColor qw(:constants);
 use Encode qw(decode encode);
+use JSON::PP;
 
 my $P = $0;
 my $D = dirname(abs_path($P));
@@ -33,6 +34,7 @@ my $chk_patch = 1;
 my $tst_only;
 my $emacs = 0;
 my $terse = 0;
+my $json = 0;
 my $showfile = 0;
 my $file = 0;
 my $git = 0;
@@ -93,6 +95,7 @@ Options:
   --patch                    treat FILE as patchfile (default)
   --emacs                    emacs compile window format
   --terse                    one line per report
+  --json                     output results as JSON
   --showfile                 emit diffed file position, not input file position
   -g, --git                  treat FILE as a single commit or git revision range
                              single git commit with:
@@ -320,6 +323,7 @@ GetOptions(
 	'patch!'	=> \$chk_patch,
 	'emacs!'	=> \$emacs,
 	'terse!'	=> \$terse,
+	'json!'		=> \$json,
 	'showfile!'	=> \$showfile,
 	'f|file!'	=> \$file,
 	'g|git!'	=> \$git,
@@ -379,6 +383,7 @@ help($help - 1) if ($help);
 
 die "$P: --git cannot be used with --file or --fix\n" if ($git && ($file || $fix));
 die "$P: --verbose cannot be used with --terse\n" if ($verbose && $terse);
+die "$P: --json cannot be used with --terse or --emacs\n" if ($json && ($terse || $emacs));
 
 if ($color =~ /^[01]$/) {
 	$color = !$color;
@@ -1351,7 +1356,7 @@ for my $filename (@ARGV) {
 	}
 	close($FILE);
 
-	if ($#ARGV > 0 && $quiet == 0) {
+	if (!$json && $#ARGV > 0 && $quiet == 0) {
 		print '-' x length($vname) . "\n";
 		print "$vname\n";
 		print '-' x length($vname) . "\n";
@@ -1372,7 +1377,7 @@ for my $filename (@ARGV) {
 	$file = $oldfile if ($is_git_file);
 }
 
-if (!$quiet) {
+if (!$quiet && !$json) {
 	hash_show_words(\%use_type, "Used");
 	hash_show_words(\%ignore_type, "Ignored");
 
@@ -2395,6 +2400,18 @@ sub report {
 
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
 
@@ -2402,6 +2419,23 @@ sub report_dump {
 	our @report;
 }
 
+sub json_print_result {
+	my ($filename, $total_errors, $total_warnings, $total_checks,
+	    $total_lines, $issues, $used_types, $ignored_types) = @_;
+	my %result = (
+		filename       => $filename,
+		total_errors   => $total_errors + 0,
+		total_warnings => $total_warnings + 0,
+		total_checks   => $total_checks + 0,
+		total_lines    => $total_lines + 0,
+		issues         => $issues,
+	);
+	$result{used_types} = $used_types if (defined $used_types);
+	$result{ignored_types} = $ignored_types if (defined $ignored_types);
+	my $json_encoder = JSON::PP->new->canonical->utf8;
+	print $json_encoder->encode(\%result) . "\n";
+}
+
 sub fixup_current_range {
 	my ($lineRef, $offset, $length) = @_;
 
@@ -2690,14 +2724,15 @@ sub process {
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
@@ -7791,18 +7826,27 @@ sub process {
 	# If we have no input at all, then there is nothing to report on
 	# so just keep quiet.
 	if ($#rawlines == -1) {
+		if ($json) {
+			json_print_result($filename, 0, 0, 0, 0, []);
+		}
 		exit(0);
 	}
 
 	# In mailback mode only produce a report in the negative, for
 	# things that appear to be patches.
 	if ($mailback && ($clean == 1 || !$is_patch)) {
+		if ($json) {
+			json_print_result($filename, 0, 0, 0, 0, []);
+		}
 		exit(0);
 	}
 
 	# This is not a patch, and we are in 'no-patch' mode so
 	# just keep quiet.
 	if (!$chk_patch && !$is_patch) {
+		if ($json) {
+			json_print_result($filename, 0, 0, 0, 0, []);
+		}
 		exit(0);
 	}
 
@@ -7850,6 +7894,13 @@ sub process {
 		}
 	}
 
+	if ($json) {
+		my @used = sort keys %use_type;
+		my @ignored = sort keys %ignore_type;
+		json_print_result($filename, $cnt_error, $cnt_warn,
+				  $cnt_chk, $cnt_lines, \@json_issues,
+				  \@used, \@ignored);
+	} else {
 	print report_dump();
 	if ($summary && !($clean == 1 && $quiet == 1)) {
 		print "$filename " if ($summary_file);
@@ -7878,8 +7929,9 @@ NOTE: Whitespace errors detected.
 EOM
 		}
 	}
+	} # end !$json
 
-	if ($clean == 0 && $fix &&
+	if (!$json && $clean == 0 && $fix &&
 	    ("@rawlines" ne "@fixed" ||
 	     $#fixed_inserted >= 0 || $#fixed_deleted >= 0)) {
 		my $newfile = $filename;
@@ -7918,7 +7970,7 @@ EOM
 		}
 	}
 
-	if ($quiet == 0) {
+	if (!$json && $quiet == 0) {
 		print "\n";
 		if ($clean == 1) {
 			print "$vname has no obvious style problems and is ready for submission.\n";
-- 
2.53.0

