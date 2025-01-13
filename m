Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20C20AF89
	for <workflows@vger.kernel.org>; Mon, 13 Jan 2025 16:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736784284; cv=none; b=A9hOT+ODnp8Zxeev5659jul+2YEjQo9KFgcPTmD8394VV0javM/oYfcrTRvPn0f5pCfNrotgL6e9KeywVjA1Vs9sorZZ6kKKsoOTITf2ylYItfxD+Mse3frUgX5/9q+CIrScl6+ihW/B/5Ynd6AGzwjgJ951Yvz7pp2AxdwLqiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736784284; c=relaxed/simple;
	bh=898AJi3XrEHjuykKfEu9B2Ef2aNDlj/0p6BNqdRz0q0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CQnwWnkChAk2tkB3ko+ZhgRzofDHHXT0rCB/YWT1fr0CTOYhwQDbVw/fTr2SMxl/yYbtLYKvrgHqRVIeJAFcTcG+1inPdiHUQzxwku2+hPexUmVsusXspzYsrvDH4HOAYmIiJhYT/wLaihY0OCKHxG80HaOWIj7OTl8de1moLzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jkOruu3K; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jkOruu3K"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4362b9c15d8so24255105e9.3
        for <workflows@vger.kernel.org>; Mon, 13 Jan 2025 08:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736784281; x=1737389081; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8iJsjt13iOc51/UXedpaSuh8SQXuFRCMoVOy4eFkEaY=;
        b=jkOruu3KqlqT7jpsuSztzLdO/RoHSiBtGCuCAZUR0Dbm3E/eQSGkH94PE9Sd6gFYS2
         0hkpMJnBpIh4CJ4qaNGue5YUaSimTohh25aTtXB4DOqKH3EwWZcsqOcTaoqZzqwcnGuI
         WzuQnq231j3tbpMfkhCvRxbnvrtEjglvWAVXoNGhI9qpgYSPi6kPHjERoP1v+AmGLTIM
         vF/P23+hdK7o1A+81PshO6o9kv9h+aH5pdVVjLjx1ztjvJrB/UqHNvh0IM9fOP2USXWm
         mtA5ECHqx+mFVSihLpnUFrCX5hOOSUenNWHyk6xKB5zppDkOy52MAj85GoHU4mOwGxEb
         B07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736784281; x=1737389081;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8iJsjt13iOc51/UXedpaSuh8SQXuFRCMoVOy4eFkEaY=;
        b=K2lFsqRYzMfHWO/Ny/+vtkrE/SZTOzPodAIS8TzRPuOwQjMVSWRqN79NOlFWnLG3fP
         pfuUkrUrTXBaQDfryrHhSsjAhbirRsrk9b7aW0K2NG7tLkglzBAdwR84b7C4BgtlXqnO
         nOg70MS/OQSz+kf53xCRWaPnrqGT+yfctKZbmGAiMrj9C4f9/8JYzHQ6eYdxUOdyreu2
         dWLMNkSwvY+Y2exvCgyXr5B2zTyGbaPVkr94aWHZDDPdGfz8Ylgy++TpDNaYNMAG4XM1
         V96ZTvcZJYFvG73/e3B+7rSr+jlSAcWWRLdFNvteop88gfjT/jZCbN81zGkxB2XwpHd6
         TuPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsij67fHH3YGbc6yKhMvwutMjMTPeJ7Ow5WB+VTGsLn1H+LQq7yH1Xg3Biyfano5dd51HkjIBEl44=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwSipLn8erj8n6yw9fsvKio4q+xiw5oC8zfwleGBtyFeanvrJo
	pN0XRZ3UWgTzzCrGrNSc+svKbCeQZx+J9amFn+ioce0xwrMZWOmD17ke6IbrBBadNvJZVVWUbrR
	EHFziKuuGyA==
X-Google-Smtp-Source: AGHT+IH8/v9AOfqbaB+ul74RwUnP2y2VXUgVGbH+j4c+1CzZN8TUArYCxCFU+cwMJLC/Yo+TCWKG3KPZcq5Y1A==
X-Received: from wrbee8.prod.google.com ([2002:a05:6000:2108:b0:38b:d7a4:7ee])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6d03:0:b0:385:e3b8:f331 with SMTP id ffacd0b85a97d-38a873035c5mr19303672f8f.14.1736784281542;
 Mon, 13 Jan 2025 08:04:41 -0800 (PST)
Date: Mon, 13 Jan 2025 16:04:23 +0000
In-Reply-To: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250113-checkpatch-ignore-v1-2-63a7a740f568@google.com>
Subject: [PATCH 2/2] docs: checkpatch: Document Checkpatch-ignore patch footer
From: Brendan Jackman <jackmanb@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

If included in patch descriptions, this will function much like the
--ignore flag.

Checkpatch-ignore: EMAIL_SUBJECT

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 Documentation/dev-tools/checkpatch.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index abb3ff6820766ee0c29112b256bcc44ce41fffba..b1d5616c72029d3d8c8c236cd8d05bb839018c0a 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -10,8 +10,12 @@ also be run on file contexts and without the kernel tree.
 
 Checkpatch is not always right. Your judgement takes precedence over checkpatch
 messages.  If your code looks better with the violations, then its probably
-best left alone.
+best left alone.  If you do that, consider adding the Checkpatch-ignore patch
+footer to record this decision.
 
+For example::
+
+  Checkpatch-ignore: EMAIL_SUBJECT,MACRO_ARG_REUSE
 
 Options
 =======
@@ -114,6 +118,9 @@ Available options:
 
    Checkpatch will not emit messages for the specified types.
 
+   Note that violations can also be permanently disabled using the
+   Checkpatch-ignore patch footer.
+
    Example::
 
      ./scripts/checkpatch.pl mypatch.patch --ignore EMAIL_SUBJECT,BRACES

-- 
2.47.1.613.gc27f4b7a9f-goog

