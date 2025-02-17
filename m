Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC6229B28
	for <workflows@vger.kernel.org>; Mon, 17 Feb 2025 17:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739813542; cv=none; b=RgI7+M9AnmAvB+Ka3/8gzdG6e9NpPQrIkzt5wdQTmaB+g6wwaL3a00xEhh8DUhyhji3wRnqJO5eddqFz9un6Z2PKzFEolsxtjo5syuhnq0LqfhAKK7uFydlV6vRZFzeXr5gqvBiUbc4QNwu/t5Hfsry/h/vSwtakvu3MCj3qgtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739813542; c=relaxed/simple;
	bh=DReRhrowuGJ6F7esY0PIoPCMimVeHSEknrzipK8NeUQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XFRf8iMAbzilFhzNd0Dy4Oy1tMbw7r6yd7wver6/OEzxE2ckn/5rYQBC2gn2babjhlJxRA3ElLniYej6phYw5P4abOCaySxXpcP94gUDAoylhknwpHmz5QRm4tBQdMrWxH1NbOtRZ4XCIZI5TlVvIhc3aZd1Rtqz/iWv3qNQmQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JzG9JX9S; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JzG9JX9S"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4398e841963so3339935e9.3
        for <workflows@vger.kernel.org>; Mon, 17 Feb 2025 09:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739813537; x=1740418337; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MI9JNAR2L7fxFiEkMgTVN/fDOoWyqDwpe8zjyVjLNrQ=;
        b=JzG9JX9SzliUlJD0XhcrP+kWWn4oIwSHAeEgvTlehcK1rNkWOCRsRLQphY1KB4dSxv
         laJs8aMhcZuCYLldGEJ9N7I/FhAPvVn1m6VNEYeD7WjIobcZwwf9I95W3rG/A+3kwJf6
         QLv4udPtfD/7Y3uW4l2h2p98AktjZBI9UWx9cFYHL9Cce0dfCweNpKEdSEoSC1bICjJo
         k/TdvSiifuhZdfZ59vrJwZo+uniO7ThHXWEE/cYri9W5pIGw5GAKAWyUxc4dWiP/KY4z
         9cH9uygZd7SkxR/CeqycHAU7DNdVY8rBz8/JxltfGKaTSSSryjqxoByq+8oh6arg6jfe
         vZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739813537; x=1740418337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MI9JNAR2L7fxFiEkMgTVN/fDOoWyqDwpe8zjyVjLNrQ=;
        b=Q1QGu4UCvtoH1I8ObL332UH3xU2/Gs4T13X5YGokNhPivrVxklyw+Ozf2m4KsyZ47p
         eO2hPYkPRHheQfSh7uRYNNShmPU1ZeJ+3ikkhXGUSDKp6yOV/35KXOZn+9NaVv2vqxg4
         wSdDsN6baR2157gNFDcFWKQH/a8gWyhR1QPukMnp/gEINhVlMeprHEDyF4sEwxnN1HtP
         kkj/IY6ancCKIu5ZKkwN0C7akfdMu8OEVjXtkRfnGWkKuMncN2uCFG68r03UOVR8D1sA
         f7Tyl5sLh1xcML613PCidArfpRAvRCTSjibjo7//p/LzxV+BH3/pCSxFWz42btPo8DBJ
         Z1/A==
X-Forwarded-Encrypted: i=1; AJvYcCUUM17MqiNKyu5kygjtFVEuYynt8xArJq8UXBNMEgI6ThAOfUlVjFKkwENFd1ZJIQH1NNOskCwo8aY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym9zQQo8dK0760Rsfcex+lzO8ilVxJ2aROlrX9EwY/QDuD7ZjR
	UK2jJeXqBlTP6YNgjVhtvIT7mdtpbA0PX04VNs9INS0WG1qP+ck1Gs1N4Gj1eR9v86BVTapcahq
	GO+XXFIXAOA==
X-Google-Smtp-Source: AGHT+IGxwdKDsj39DSw/LfYL4Gf3CqZqqOiGdgJBzDbiG5yRGgSE0Wz3KuRh78eMj5ueC9b1JjK4sFp9W5rOSA==
X-Received: from wmbfl26.prod.google.com ([2002:a05:600c:b9a:b0:439:7f3e:39c6])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5254:b0:439:38a1:e49 with SMTP id 5b1f17b1804b1-4396e6d7c38mr105342225e9.6.1739813537787;
 Mon, 17 Feb 2025 09:32:17 -0800 (PST)
Date: Mon, 17 Feb 2025 17:32:10 +0000
In-Reply-To: <20250217-checkpatch-ignore-v2-0-ecfb50e03bb0@google.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250217-checkpatch-ignore-v2-0-ecfb50e03bb0@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250217-checkpatch-ignore-v2-1-ecfb50e03bb0@google.com>
Subject: [PATCH RESEND v2 1/2] checkpatch: Add support for checkpatch-ignore notes
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
2.48.1.601.g30ceb7b040-goog

