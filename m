Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8BA3EA66
	for <workflows@vger.kernel.org>; Thu, 26 Mar 2026 06:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774506041; cv=none; b=F9PhDi0lnlaGFMgUr5PKplXwxtSp8tUzERYMmVIjfpcJqs4/CEeLCEcZkRJMm3zOf0/AymAldTPb9BDzlg8VQg5pt/HtrsNazBI8WiMmDXKdJ4OT+TzPcP41BD52u6odRgdJAQ69m/7M69AkNbQYjtjCgBz++Fa4GyxZbrmx0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774506041; c=relaxed/simple;
	bh=br/jwXyKsOgF8QpG+OEMmn/wjLJg+ymOyi2ueX2+2uA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jR+3MkFBNzgTvi2ONSO34cb0rtmFxz6lcG0YJWF4bklyxoA8ATIMsW1SLhlwKTVzFbVYdlmZCXy8+DLxy36KGkv4g2PZetyVp6TJAdrr8Oqgka/Ox7cyeSJa3jjWcPdupwyl4J5syU19Y0DR8zHCw1lTcPtswXT9cPQFq/K5Qrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Owp7F8af; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Owp7F8af"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12732e6a123so1706524c88.1
        for <workflows@vger.kernel.org>; Wed, 25 Mar 2026 23:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774506039; x=1775110839; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VofYlHZ2Eo1t9FKVicPQrSRmzPkyfNodwvF5CvNMdtk=;
        b=Owp7F8afms/+Pn2vqioDtJJxj7hTFuRkb3f37mdZ/ThwYceMufrtLB8U3rtExIs3dF
         81xzx0iF2NCMXx3ZOyRyA+8BktgwVGUkXdWP67CuN6eHcFvwjP2c1oVra+0tdxJAtg/b
         +y5Ej1rrJljJN8yHP2fJnKrZTKZma8OVj/GcbgqNKRAoziuqVRIGzdg3lsHzZlb+U+oB
         +xndyP31pIuUGuZqDij8Nxyzh2eGPwzOskjFIafyn2TnF0bGDLuDFSR+9W3knuMSDfMl
         KBvrh2BqHfHmM6/bZ1A5NTfnVKNxlzx1jxPmUEPCj4IpHrYUw2JiOHSQjVlSEy2Nmc4G
         S53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774506039; x=1775110839;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VofYlHZ2Eo1t9FKVicPQrSRmzPkyfNodwvF5CvNMdtk=;
        b=KizMBLfawGL8e4DBDLScKZPZb3U7Kjwgk/VBiTQwUoMxQrXMnCrR29oxCLKpOJ9VX4
         0o6QeGQvlcTQMEL8433ZHtU7PMppz0feQlxgmqUzrVpSI99HzW0z91g3cmFchCH5v/Ry
         mhD8fz2B/duVK7T/LTFBrYy9lrS/wReKQ4GQppJ+l3FwHgTopdVRcVBVl9FqqmuYKRSJ
         tp+V6wf8i0ZIsGkyvPM8tpYSB06Qy1yGWCFwPNG2D57XmJzZ5n3LH029IMilC8jv/eYK
         Dy2J7ALlu0DRBtp2Zhfpdb68c5Qs9sChfJ735CWaELOaSFeqZBLZMfkAU+HC4fYo/u5O
         GcTg==
X-Forwarded-Encrypted: i=1; AJvYcCX2G7Za/TTCxhMJT+mCMCnaYQsvJOjb/N9Ay7nbJBT/K3Qk1G36vuYat2sKpS8RRMaCBRQUwnxTNX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxECjNq0E18nlNO7RLlwAlagcf8vqfROGiKLsky3xZTM1ar79Z4
	P4R8T7nHsbLBAAxbSmftaGZ19wwpa2B7FnyqhXx7f59v2eRYiDCo5UXK
X-Gm-Gg: ATEYQzxeMcrWUhTTRlqkOoSuI11rv8F0lf1gJ6xEZWZjmL/KDmP2Zn2izeCB4nZRZPH
	nPxwvhFGv9AF0827/2Hu6m7klaFnAVfh84sPzteGdEhkcPIjHwOZdcsSWNYqI5BU4ibAahqqOc5
	hhe8y1+hW9NBdJhgfWukQmhhPCESlC5lG0t/oyVo96tfYWH6bBhgED91pLdc7O2G6Hob8jSnJjT
	udFFx0MIrzPSRibVEnq1nvJqj22q2NCQNeGOQRV1jxnTAmw2tXZfFqLciFoevLo1AZNrpE6XfHn
	oSyrx8LJcWIybXD7ep/82FOweT1NSceI6xeFX09q8sxyUBqe/USvfGoXQR/N0cOo9hKqHxszKjf
	QPN1D4gK9dKU7PubVjZXfZ7Gtbzsf7m9ChC7uRKuRYt955cKXD7+whz3Wpy0FlTLwnrBzgeCVrv
	4x0rRmm0YWoX+gMpUgVHXQe99fWFEF6EIOGLc6jImevgwosZSxfzDeNYjx+sN6X22n
X-Received: by 2002:a05:7022:670f:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-12a96ed3ea0mr4115540c88.26.1774506038953;
        Wed, 25 Mar 2026 23:20:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa762430bsm3051833c88.10.2026.03.25.23.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 23:20:37 -0700 (PDT)
Date: Wed, 25 Mar 2026 23:20:34 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, 
	Andy Whitcroft <apw@canonical.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] checkpatch: allow correctly handle full files on stdin
Message-ID: <acTPXMJfkHLeItrK@google.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

checkpatch does not handle full files well when they are passed on
stdin, because it does not know how to treat the text, and whether it is
a C file, or a DTS file, or something else, and so it assumes that when
it works with stdin it should be a unified diff. For full files it
expects to have a file name as an argument and read the contents from
disk. Unfortunately this does not well when trying to use checkpatch as
an online linter and feed it contents of an editor buffer that have not
made it to the disk yet.

To solve the above introduce a new optional argument --stdin-filename=FILE
that allows tell checkpatch the kind of file it is dealing with and
apply appropriate set of checks and rules to it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst |  4 ++++
 scripts/checkpatch.pl                  | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index dccede68698c..b521e3ca6ebf 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -68,6 +68,10 @@ Available options:
 
    Show the diffed file position instead of the input file position.
 
+ - --stdin-filename
+
+   When using stdin, identify the file as FILE.
+
  - -g,  --git
 
    Treat FILE as a single commit or a git revision range.
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e56374662ff7..e26951ceb36b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -57,6 +57,7 @@ my %ignore_type = ();
 my @ignore = ();
 my $help = 0;
 my $configuration_file = ".checkpatch.conf";
+my $stdin_filename;
 my $max_line_length = 100;
 my $ignore_perl_version = 0;
 my $minimum_perl_version = 5.10.0;
@@ -94,6 +95,7 @@ Options:
   --emacs                    emacs compile window format
   --terse                    one line per report
   --showfile                 emit diffed file position, not input file position
+  --stdin-filename=FILE      when using stdin, identify the file as FILE
   -g, --git                  treat FILE as a single commit or git revision range
                              single git commit with:
                                <rev>
@@ -323,6 +325,7 @@ GetOptions(
 	'showfile!'	=> \$showfile,
 	'f|file!'	=> \$file,
 	'g|git!'	=> \$git,
+	'stdin-filename=s' => \$stdin_filename,
 	'subjective!'	=> \$check,
 	'strict!'	=> \$check,
 	'ignore=s'	=> \@ignore,
@@ -2652,6 +2655,10 @@ sub is_userspace {
 sub process {
 	my $filename = shift;
 
+	if ($filename eq '-' && defined($stdin_filename)) {
+		$filename = $stdin_filename;
+	}
+
 	my $linenr=0;
 	my $prevline="";
 	my $prevrawline="";
@@ -2891,6 +2898,10 @@ sub process {
 			$realfile =~ s@^([^/]*)/@@ if (!$file);
 			$in_commit_log = 0;
 
+			if ($realfile eq "-" && defined($stdin_filename)) {
+				$realfile = $stdin_filename;
+			}
+
 			$p1_prefix = $1;
 			if (!$file && $tree && $p1_prefix ne '' &&
 			    -e "$root/$p1_prefix") {
-- 
2.53.0.1018.g2bb0e51243-goog


-- 
Dmitry
