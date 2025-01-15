Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2020F14E2CF
	for <workflows@vger.kernel.org>; Wed, 15 Jan 2025 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955213; cv=none; b=GWmT3+XM0jW/6dykH/eXeDZClNzYNig/Bfg4ERni2Dt5kHlw7JB0PtpiNsX/WOy5bH/WkmNpn304/LNOp8PZd94LWljdH0a8QauStDDKgUNfLWir/puJazNwWoscbA3qlSj2oIT94e9k6cN2tEgExnR4sL0UD3s6CiiCe7QRi50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955213; c=relaxed/simple;
	bh=dIIWMhXFshwK0c8HjNy74unEM10fKpL9De0DaDB8PYc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CdDB2JNSOJ5qkUBdyeQjiN0xNexm4NEw/mx1jScaQl+Jc6hLA8oqKYACwXMbPSyElBO/c7d+H9p4YbTq0MLFR4wpC3Ge8D9soZr3Uma61WOrJFAaBtKaHur1jVpE8G0mkWMj68h+AFp7/s86MpyYOlcVZA73yaE74+id+/rIDBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K6+ohymi; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K6+ohymi"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3862be3bfc9so4020601f8f.3
        for <workflows@vger.kernel.org>; Wed, 15 Jan 2025 07:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736955209; x=1737560009; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hb5nIvWb71zdixZrhCvXh2iRHQbvKVO57HrQVmjQSXE=;
        b=K6+ohymizA6SWvlPusW32Gnlo5VHljYj+F9MNhx2JU/vKBFW6Su+9hIVguUuADuxEO
         XJvInhg6/8rV7neUk1jSN3VUsPr3/wKzQMoAGGDbVScI3pWRsk4JrQQfijb8LC3fhPeN
         cGwdlXbRTP/zT0sB2MhcMlx//M1TlEoi3ZDpXHNi44SEe75vjUn/K8HS2xQ58UfhwceN
         jDQSm7+Exby7VIArzFP79Q4qII7ge4EdIm4foNIQG/B1Gxi4cFbukraXXj2G9NXrJtfa
         U+1lXcetputKaQsOp349ICHYZXlE61/SpgtmlWicDvUC8ADsdEFtbH7keVy7onpHn8XI
         Kcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955209; x=1737560009;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hb5nIvWb71zdixZrhCvXh2iRHQbvKVO57HrQVmjQSXE=;
        b=JG0XhwH2vbN76Y4wsFUYq9HCPp5SAkVcycO7xv5YPijnf/iJCzCkoog/qS63coaZ/K
         jW0F8++Q86ULnzhbAVxkH/wRqj1NkTKNG8+0imwB4PQ0IfFR6XYQ7oExfnhMOoruxgWT
         tDNjwhx5lagmaVYArxX8/OjP6PY5ILAD91KuzO748PkY3B9VKDavBkuXxvcc3LsHigj/
         Gkz73nrgXe5uh5vrit+ZP8oSPhyFFkz2ld702hPJSfetOvIZODLIlqRcZTuAWr2fN9Fe
         7oGrGL3C4k9Fey8ow0T+KBhvUj+yZNrggGLHpEwrph6GCQcJbr1hU5mjL/iObRnf4Nq+
         KwvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzxflSnC9C5lxIia5lOTP7ZFz+lcrFXLe3fWfi4WvW0+WGqp8MqGAQE/j/RDSdPLxvfS4bTMuCZ8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhJPywTEJuLwhsD4VrgUGhhcu4spVT1nb0bTE2fSxK4dAWcyW9
	u7mM7KqJ7RrPq7c0yNMWsSq67O4zxoC08SelmvHaNL7gAzCQa9rF+B+U1IXNVxTwsv9qwTLTdZT
	lYdiREjM/UQ==
X-Google-Smtp-Source: AGHT+IEOG/8ZYybzXMLqp4IPj8wc7/hNOUswEq3NyYE3RGEusCYfw84ucZSBSOkJU0GLZHB1mGHoEx2594mIRw==
X-Received: from wmpz18.prod.google.com ([2002:a05:600c:a12:b0:434:ff52:1c7])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1ac6:b0:38b:da34:5915 with SMTP id ffacd0b85a97d-38bda34591bmr12849093f8f.23.1736955209523;
 Wed, 15 Jan 2025 07:33:29 -0800 (PST)
Date: Wed, 15 Jan 2025 15:33:21 +0000
In-Reply-To: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250115-checkpatch-ignore-v2-1-8467750bf713@google.com>
Subject: [PATCH v2 1/2] checkpatch: Add support for checkpatch-ignore notes
From: Brendan Jackman <jackmanb@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

Checkpatch sometimes has false positives. This makes it less useful for
automatic usage: tools like b4 [0] can run checkpatch on all of your
patches and give you a quick overview. When iterating on a branch, it's
tiresome to manually re-check that any errors are known false positives.

This patch adds a mechanism to record alongside the patch that it might
produce certain checkpatch errors, and that these are expected false
positives. There are two aspects to this mechanism:

1. If a block like:

   Notes (checkpatch-ignore):
     FOO,BAR
     BAZ

   Is found before the diff in the patch content, FOO, BAR and BAZ error
   types are ignored while processing this file.

   Its expected that users put this in the "graveyard" i.e. the region
   between the --- and the beginning of the diff.

2. --notes=checkpatch-ignore is added to the `git format-patch`
   command that checkpatch.pl uses in --git mode, so that if the commit
   being inspected has a note [1] under the checkpatch-ignore ref, it
   will be formatted into a block like the one above.

To avoid significant reworks to the Perl code, this is implemented by
mutating a global variable while processing each patch. (The variable
name refers to a patch as a "file" for consistency with other code).

Because the main loop in process() begins to emit errors before it has
necessarily processed the checkpatch-ignore block, this parsing is done
separately in its own loop.

[0] b4 - see "--check" arg
    https://b4.docs.kernel.org/en/latest/contributor/prep.html

[1] https://git-scm.com/docs/git-notes

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---

Notes (checkpatch-ignore):
    EMAIL_SUBJECT

 scripts/checkpatch.pl | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76caffbbb2418e5dbea7551d374406..ce6914a845ec3f936ad656fa123f58aa85ce4b2f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -53,7 +53,10 @@ my %debug;
 my %camelcase = ();
 my %use_type = ();
 my @use = ();
+# Error types to ignore during the whole invocation.
 my %ignore_type = ();
+# Error types to be ignored in the present "file" (i.e. patch).
+my %file_ignore_type = ();
 my @ignore = ();
 my $help = 0;
 my $configuration_file = ".checkpatch.conf";
@@ -1306,7 +1309,7 @@ for my $filename (@ARGV) {
 	my $oldfile = $file;
 	$file = 1 if ($is_git_file);
 	if ($git) {
-		open($FILE, '-|', "git format-patch -M --stdout -1 $filename") ||
+		open($FILE, '-|', "git format-patch --notes=checkpatch-ignore -M --stdout -1 $filename") ||
 			die "$P: $filename: git format-patch failed - $!\n";
 	} elsif ($file) {
 		open($FILE, '-|', "diff -u /dev/null $filename") ||
@@ -2329,7 +2332,7 @@ sub show_type {
 
 	return defined $use_type{$type} if (scalar keys %use_type > 0);
 
-	return !defined $ignore_type{$type};
+	return !defined $ignore_type{$type} && !defined $file_ignore_type{$type};
 }
 
 sub report {
@@ -2624,6 +2627,29 @@ sub exclude_global_initialisers {
 		$realfile =~ m@/bpf/.*\.bpf\.c$@;
 }
 
+# Parse the "Notes (checkpatch-ignore):" block in the region before the diff,
+# and set file_ignore_type accordingly.
+sub parse_checkpatch_ignore {
+	my $linesRef = shift;
+	my $in_checkpatch_ignore = 0;
+
+	foreach my $line (@$linesRef) {
+		# have we reached the actual diff?
+		if ($line =~ /^diff --git.*?(\s+)$/ || $line =~ /^\+\+\+\s+(\s+)/) {
+			last;
+		}
+
+		if ($in_checkpatch_ignore) {
+			if ($line =~ /^\s*$/) {
+				last;
+			}
+			hash_save_array_words(\%file_ignore_type, [$line]);
+		} elsif ($line =~ /^Notes \(checkpatch-ignore\):\s*/) {
+			$in_checkpatch_ignore = 1;
+		}
+	}
+}
+
 sub process {
 	my $filename = shift;
 
@@ -2701,6 +2727,8 @@ sub process {
 
 	my $checklicenseline = 1;
 
+	%file_ignore_type = ();
+
 	sanitise_line_reset();
 	my $line;
 	foreach my $rawline (@rawlines) {
@@ -2780,6 +2808,8 @@ sub process {
 		}
 	}
 
+	parse_checkpatch_ignore(\@lines);
+
 	$prefix = '';
 
 	$realcnt = 0;

-- 
2.48.0.rc2.279.g1de40edade-goog

