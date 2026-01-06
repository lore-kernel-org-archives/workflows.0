Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692B333E361
	for <workflows@vger.kernel.org>; Tue,  6 Jan 2026 19:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767726572; cv=none; b=d5yMipttNJXCNSuairED9sgwMME22wKbs+wq3VizxEiw7idqS/7SCz2e39zqWog+Vvj9DYexcy9gubGXk0cUuZhVrLotdIWc5qPnF1q5SUwifsOdg1IlsnB1b3knLO7hEv6sxrL2ueaXLlGEFYkda8sFojbRbqAVOYwtDCqUgy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767726572; c=relaxed/simple;
	bh=j0jDV4lbFVQ9QVQdB139GuIVebX7BEtCYepQXaLrbqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NICz/I/qzMMcdNU/dq09zDGYzcXLReeHf6gxsAm+ddihNGnxy/X5k63xELX2tkyZhTLSPrTqZwBrFOLXcaiNaXGSbc5O3VjeNDfOp8ZEM1GFJMHW3O1sdf9Bz+hzWHXNM9MMAVL1xPpIEDHn/kWtHzKziIJgGr34ra2gYdGuRVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FS6D/Mta; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FS6D/Mta"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a099233e8dso11650075ad.3
        for <workflows@vger.kernel.org>; Tue, 06 Jan 2026 11:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767726571; x=1768331371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZDIxAuQXdSZKM+omOFdw1K6fCzWMGD3B/LiysTgYjs=;
        b=FS6D/MtaN2mec5qP9Q2U7xSzHsDTnCfOl01/noWmYTPyH2osEUrnCX8bDLz2nVJqbm
         OZZyC33z8LppBERZS8VGJHrAFKUeymTSdow3dTfe7CB43z1R6yOQzRVVJ8vvy69G3ZMu
         YgdnXptH+lI0NMu/B1MJ+zkGw1OA4xE6+2AnwTKKTy2j/14GqB7QzERjL1OgPr11oAht
         SV5QI9uSi4xQ6uhxuf7R3yrCjNEPajlnWuRpUeB6V0veQH7LenSI40mfmT+1egx4cWAJ
         yoceJFfHC4l+tuwObO15/JeiptK06VGDQtMJxpu1jRhDleW6GUH4chW4vAHTLt3pbTgb
         2qHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726571; x=1768331371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZDIxAuQXdSZKM+omOFdw1K6fCzWMGD3B/LiysTgYjs=;
        b=K8RdBA6swgJdm/miP4L2NoU8p/fE8mJBEW+6WD+h3eS81O+68z9SPtVZ7sQxyZtvXs
         t91xxFNckKBYf/vGTb8qIuaxtZYVchFuYB+5/36mZro/uTd7N05mPs/rNGxgus3g8uGH
         24HR1o6dAAaPQObOLzuzALQaxgieSy4TeHoD/dGhRaebkIEeJcF+bTuteWLWqPOi7p83
         8GrXNxJy9u8MZYtt0Ii5WVAMLXlrX146KOIzOFp2lPzT+BIRvF/WJWSF8YF4WYuqoCAz
         G3ZUiBmHukPq+1ObJlZ5GhfduUK5hJg2OUQ1WEvnZ9iAs1kSL9hEBpO+OOfKh9fFgCYx
         4OAg==
X-Forwarded-Encrypted: i=1; AJvYcCWUHmXAg+MKvPCRSkNF5umXX6IgCLsc/pZsurHZO+mm3kkH0LuAtOSAYh1BLmBEig60VQdIj9exRtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBAoNhDwArpLp/L6YbIVqjOORKZT399zgCvMS8+JoqFK1czWBO
	VncufuyOJoEhvp7ICREMvJZuGaGDzJUgIcF2awmqIDNHPZe1zhCTzXYc
X-Gm-Gg: AY/fxX4EkwuhIr3GVIAmkQfQ+oQkhddzyKTpmyprS4mibP5RNJS+DmnRBzsz6aXbPfn
	tPvZu2e94ucZG2c1HNGeS3TvEteH0G3c19VKFYcml1d6SpfnAEKTVEqbGBNTOVJTNrtkmVf3Ff+
	BfEKJ+ShrLeyO7wpze6TkH3i2BK6Mzhm9S673M5n5htcl7+AeQuQ3LpYrCBjR6Rn0MbtaHeh6W6
	R1mp2W6lId22jwxqbHO7oR2wiRy06VRJuBxOxTbzCDWss/+zQkZqKEo66ArllKukOTiQ/AHLXvs
	dYZgTe3cl9hHFarrkh59xH9PLIh37IBqgrpKVE7bebWLFpswuW7NYV5tAvleG60wJvqJISicr0w
	C0lxfagL6OZ0G+j7gen0rc1KGwpMaVZK0ekXw8kNkhSZ9vHPkQj4v11IeO83MovbNRDJJrE8mrv
	PpcYxWCUEGU+ejvCmRyQ==
X-Google-Smtp-Source: AGHT+IE1WFyskV9UBz53SZomuLYRFUJQlyS3/Vk4tjY//MxsM+cH3sL/yfbwmTq7HM4vYlJFb86sSA==
X-Received: by 2002:a17:902:e80d:b0:295:9db1:ff3a with SMTP id d9443c01a7336-2a3e2df5181mr37055245ad.28.1767726570816;
        Tue, 06 Jan 2026 11:09:30 -0800 (PST)
Received: from rivendell ([101.0.62.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc78c0sm29380975ad.69.2026.01.06.11.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:09:30 -0800 (PST)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH RESEND 3/3] Documentation: Coccinelle: document debug log handling
Date: Wed,  7 Jan 2026 00:38:36 +0530
Message-ID: <20260106190836.36630-4-benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106190836.36630-1-benjamin.philip495@gmail.com>
References: <20260106190836.36630-1-benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current debug documentation does not mention that logs are printed
to stdout unless DEBUG_FILE is set. It also doesn't mention that
Coccinelle cannot overwrite debug files.

Document this behaviour in the examples and reference it in the
debugging section.

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 Documentation/dev-tools/coccinelle.rst | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
index 6e70a1e9a3c0..c714780d458a 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -127,6 +127,18 @@ To enable verbose messages set the V= variable, for example::
 
    make coccicheck MODE=report V=1
 
+By default, coccicheck will print debug logs to stdout and redirect stderr to
+/dev/null. This can make coccicheck output difficult to read and understand.
+Debug and error messages can instead be written to a debug file instead by
+setting the ``DEBUG_FILE`` variable::
+
+    make coccicheck MODE=report DEBUG_FILE="cocci.log"
+
+Coccinelle cannot overwrite a debug file. Instead of repeatedly deleting a log
+file, you could include the datetime in the debug file name::
+
+    make coccicheck MODE=report DEBUG_FILE="cocci-$(date -Iseconds).log"
+
 Coccinelle parallelization
 --------------------------
 
@@ -208,11 +220,10 @@ include options matching the options used when we compile the kernel.
 You can learn what these options are by using V=1; you could then
 manually run Coccinelle with debug options added.
 
-Alternatively you can debug running Coccinelle against SmPL patches
-by asking for stderr to be redirected to stderr. By default stderr
-is redirected to /dev/null; if you'd like to capture stderr you
-can specify the ``DEBUG_FILE="file.txt"`` option to coccicheck. For
-instance::
+An easier approach to debug running Coccinelle against SmPL patches is to ask
+coccicheck to redirect stderr to a debug file. As mentioned in the examples, by
+default stderr is redirected to /dev/null; if you'd like to capture stderr you
+can specify the ``DEBUG_FILE="file.txt"`` option to coccicheck. For instance::
 
     rm -f cocci.err
     make coccicheck COCCI=scripts/coccinelle/free/kfree.cocci MODE=report DEBUG_FILE=cocci.err
-- 
2.52.0

