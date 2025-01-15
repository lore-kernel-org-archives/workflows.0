Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1118015665D
	for <workflows@vger.kernel.org>; Wed, 15 Jan 2025 15:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955214; cv=none; b=bzdUQehBFeknAf0yx3+bZs8uNrYf75naesYB9dTBXRE+cR66xrOPponAL3qhcfb1Q4F2vbOZh+BYpY929ERIi0zh9e7oLYvAsl2eeUE2advRImnGiprvVkc9buacSEI9Tn1T+Zm/YwE2wIAM7kM33FdFp3Nn7BeFNr2NVoL2OSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955214; c=relaxed/simple;
	bh=+PPX6rjFdlziNFuryqikW6xgTL5yZ0HV1bTm3C+YQ7w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CYv7bQNcjP7GQnGp7EWHq5DAt1q52PvHrepOcha7PuoaJ6kuPdNWGbXsQThC558TMkRQwT6+abBFcgpVGUjRZ4kf3qYmjjpAkVxO2y3F5BeHNEeAvt9R5xUvWkS0QIYoeGoPOl8BudseMDJXkdDHecC+pVX2eMdOrjDkqOnywu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ULw9c8/N; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ULw9c8/N"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so31145775e9.2
        for <workflows@vger.kernel.org>; Wed, 15 Jan 2025 07:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736955211; x=1737560011; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nfadiWtqn+p1ONmxzwJPCQMVLUFuEvN56WRQoWxcZ0o=;
        b=ULw9c8/N5PCYctpDqoLlsf1y/EzWOoNKo2fAFFLGg71DqvqrphgMZe9z1n+MgOjftQ
         IqhQVzuX02ITLrakMMLpD8MfEDavCt+jOZoK+2rKxE+I33taEcu7SPx1azY2cmUMzlZW
         jC0uHFlxEBP7sV+i9IdapMmlDeEl09x2lX6jUBAhQyII5qlFUShy8QrZZTVfQp+jP2A0
         4Lb9hJ6rZ4/hhEiAIXsFa2ep+1AxQzOAy+PKlBVEVW+E3Lm1cISlTiImUeSsOu69BQh4
         sQg1+wDCrcZWTY42EmvKxPz70PHje4iMssczKeUIYJOTOwI8iA9n+Psq+CCePYVOtpMN
         S5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955211; x=1737560011;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfadiWtqn+p1ONmxzwJPCQMVLUFuEvN56WRQoWxcZ0o=;
        b=YYJ3XsYkhfp2RERQm/R3yf3rL6fgmjfi9SyEy27lMzEfmclR6lkTbE2fNU/oPU9itV
         cnFyHeDrb3YWmGBD/AhrZ3TljnnSx+12E4TwWWrf86vRJ0L2jVYE0Ylz4RUGHJ8OsAVr
         WWl5INoIuTFCV0bDf4cnK1gpK14JiMbbihrxfT1s23wBMetSy/uJfTnei26Hv79YbkRi
         QlYFQE+7yAautCz5FoTLu3+2VKMap+FnlQrgLC8xifbkPbOA4vs85dMpMdsvy4AbA4ir
         FK+w2B3xFrvOIjoyuyC8f27qc9W67rUpVDounuDYH5z+E4z3DRKo7Azr6LPAWPP0GvOh
         j05A==
X-Forwarded-Encrypted: i=1; AJvYcCUs8vl53ow7WDGgervIeKDK+iE0UnUf/1z3APHHe9h7H2X7cUcW9cOneXjZcP831WOJ4GoEgUlg3F0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGifzJ6CJ7iNbf6FwkeTgUAZsbSlVfCp6fmDIkmEkgVDWJlK3E
	grL7/gcbPD/q1qQbcrSJCN7tXRN5IUeWPsn8g20czfG4F/29Q+5gzI9xckpsZJOeMzviHTBWj/A
	gIoyWq58MPQ==
X-Google-Smtp-Source: AGHT+IFothktwpNbViGy9RF8eHVba1vXOKRjZ/bBYYNsbHos30SP1sZUHHHbgEboGRtUdAyieEbAgjsqiC+OaQ==
X-Received: from wmbbd9.prod.google.com ([2002:a05:600c:1f09:b0:434:a2c3:d51b])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1987:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-436e2679e05mr280876775e9.4.1736955211605;
 Wed, 15 Jan 2025 07:33:31 -0800 (PST)
Date: Wed, 15 Jan 2025 15:33:22 +0000
In-Reply-To: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250115-checkpatch-ignore-v2-2-8467750bf713@google.com>
Subject: [PATCH v2 2/2] docs: checkpatch: Document checkpatch-ignore feature
From: Brendan Jackman <jackmanb@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

If included in patch descriptions, this will function much like the
--ignore flag.

It requires some rather obscure Git features to take advantage of
this, so provide some examples of how to do that.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---

Notes (checkpatch-ignore):
    EMAIL_SUBJECT

 Documentation/dev-tools/checkpatch.rst | 46 ++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index abb3ff6820766ee0c29112b256bcc44ce41fffba..6215b24b25b36709c815cf08de33f1609c80c0c7 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -12,6 +12,49 @@ Checkpatch is not always right. Your judgement takes precedence over checkpatch
 messages.  If your code looks better with the violations, then its probably
 best left alone.
 
+Inoring violations
+==================
+
+As well as the --ignore flag documented below, violation types can be ignored
+for a specific patch by including a block after the "---" in the following
+format::
+
+  Notes(checkpatch-ignore):
+    TYPE_1,TYPE_2
+    TYPE_3
+
+If using Git, you can store that information alongside your commit using
+`notes <https://git-scm.com/docs/git-notes>`_. To set this up:
+
+1. Configure git to include the `checkpatch-ignore` notes ref in formatted
+   patches::
+
+     git config set format.notes checkpatch-ignore
+
+   If you use checkpatch in `--git` mode, this isn't necessary, it will include
+   the `checkpatch-ignore` note regardless.
+
+2. Configure git to persist notes across amends and rebases::
+
+     git config set notes.rewriteRef "refs/notes/checkpatch-ignore"
+
+   (To enable this behaviour for _all_ notes, set `refs/notes/**` instead).
+
+   Also ensure that `notes.rewrite.rebase` and `notes.rewrite.amend` have not
+   been set to `false`.
+
+3. Now, to set the note on the HEAD commit, use a command like::
+
+     git notes --ref checkpatch-ignore add -m "TYPE_1,TYPE_2"
+
+   Beware that blank lines terminate the `checkpatch-ignore` block, so if you
+   use `git notes append` to ignore additional types, you'll need to also set
+   `--no-separator`::
+
+     git notes --ref checkpatch-ignore append -m "TYPE_3" --no-separator
+
+To see the names of the error type in checkpatch output, set the `--show-types`
+option.
 
 Options
 =======
@@ -114,6 +157,9 @@ Available options:
 
    Checkpatch will not emit messages for the specified types.
 
+   Note that violations can also be permanently disabled using the
+   Checkpatch-ignore patch footer.
+
    Example::
 
      ./scripts/checkpatch.pl mypatch.patch --ignore EMAIL_SUBJECT,BRACES

-- 
2.48.0.rc2.279.g1de40edade-goog

