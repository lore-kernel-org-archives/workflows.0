Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12675168B1
	for <workflows@vger.kernel.org>; Sat,  3 Feb 2024 22:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707000130; cv=none; b=Gp3b5uHIh3GRmK/UrGpeBSL3/e85yHdKl/l0tS1hrD0tNGP69R5xvaE6qMAVv9aJNUyP6eoqYYhbmz8aTiDS8F8wANIt5JNg4qN2+Bmc4uv2o1sCrpU4HxoQ2MKjCl3icNbu1FltlNJUZgCGb3QUD0OPFwg3f3uSZQryAovK+OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707000130; c=relaxed/simple;
	bh=VRgg9tPPV9ch9xVJUoSdcCPIv9S0ZNXn78YmVch3TGI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Afs6vQnJcxbCmvh1glaVC7qbsZqBn5edbzspkYAYw2lJkw9KA0NmoDBUlej35/Hso8MGqGV1TLu1R8yI3eRmBzDzP2O/n7/Ouoi29nLBYAI/pO91t7tEKI9Z+MHQP/xtZ3tmzskVims+EawMHF0GLvh5Gie7s0dVZDDqzKej9XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=Shahi+uV; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="Shahi+uV"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5114c05806eso73321e87.1
        for <workflows@vger.kernel.org>; Sat, 03 Feb 2024 14:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1707000126; x=1707604926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pUvdF72w2iDqX6eJFryQDKrSqvsabYyjqNTlDp/2Ts=;
        b=Shahi+uVv5Jcqs2zxX02dgEREOkT5swaIMXdkJcSNGrNI7FTfmf4IEXsVNlimWeeA2
         VFVSa0YVt0bHV83gILEsKWHrwEtJHDG6t/ErR3q9/bWOvHlxvLek21vJiDQHmB1UiSYu
         nqEvmxkwEsXh6HH1PEKQKTi2mS8YY9HfYuJk3t66xI2XlJofpqcC+mdSjALtrSxcCntj
         2mGK/7k4UJmiREwpmLeJYBdhJ/j7JWrlr0rrfn+ofaUBk2EQ3sZNsmJprpqHmAM3Ju/4
         42uXtg5qYt2+/MCNNlyHiQY7btCR9WtWrbJ3jsyLupyp7YCQt5g7zdTld502fZ3C8qwp
         zZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707000126; x=1707604926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pUvdF72w2iDqX6eJFryQDKrSqvsabYyjqNTlDp/2Ts=;
        b=b6fLjMl/jnNWNpkeBNZYNQrHUKgqARRF4qZKPJaRjhBMZoBFQlMS4LWmsqyYg2uybU
         b7Z0qhNAgzbqKrlBhojadj5DByyUTd0Jlx7EhlKhTJAeCvcQrZub3W0EcYICrpxiH+UH
         whBCxtKtrpuruFZ16nCfRCujC1rIz7Rsvbg28OY7CDISyD7kSeYW0i8R5FB25/OexIX/
         TFqvbaZIe9MojdrZ4QRo9p4pUcde4xFTeEwf2D+zzbr4x9RuPJB5d1c0AGlyOOInxB2s
         q3XYgTXXFXc5BsyV9+I6IqrcO3b4Rqkzv25CghuDj0EN7ETMo/fJ5jlmtnTi9mhboFCK
         VewQ==
X-Gm-Message-State: AOJu0YwPYz3oyQFkZXOz2gQIQ6NhiDiXozxpWwzAzUlVii4047WyHeXN
	NQI5UxQyXPxMbrnMhZPOFMdiS1N/dIENG7HczA1tipLkBNnRQ5KdJj7asWeZWH4=
X-Google-Smtp-Source: AGHT+IE9qPqtc1+PfvjJ+mQSHAJeywN/9Ky3PPuW1h7Jw1sd53SYl7XPn1yGC0KN/q7qrQ/T88KkMg==
X-Received: by 2002:a05:6512:3b82:b0:511:2fdf:ce3b with SMTP id g2-20020a0565123b8200b005112fdfce3bmr7522710lfv.15.1707000126012;
        Sat, 03 Feb 2024 14:42:06 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVzSbN8YU69aED7LPdo/0CeRE01XONXwbdpqTN5X3IY9EWWvwmIUdvY3i/l/EjV7MjgFFWvNkwMcxXPm7pCgLyF7kyGICK9piXkMfGPWCCyCg5g557tC17mp8kaqSnrWnkKczoJqarViosz/tm471+fV/hAlCK6ac0eoyNkIQqXT1U=
Received: from debian.fritz.box (aftr-82-135-80-223.dynamic.mnet-online.de. [82.135.80.223])
        by smtp.gmail.com with ESMTPSA id wb6-20020a170907d50600b00a37026ef8e8sm2271055ejc.18.2024.02.03.14.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 14:42:05 -0800 (PST)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] Documentation: coding-style: Update syntax highlighting for code-blocks
Date: Sat,  3 Feb 2024 23:39:26 +0100
Message-Id: <20240203223926.5077-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use c and elisp instead of none in code-blocks

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 Documentation/process/coding-style.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index c48382c6b477..a75c7044d8b7 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -203,7 +203,7 @@ Do not unnecessarily use braces where a single statement will do.
 
 and
 
-.. code-block:: none
+.. code-block:: c
 
 	if (condition)
 		do_this();
@@ -660,7 +660,7 @@ make a good program).
 So, you can either get rid of GNU emacs, or change it to use saner
 values.  To do the latter, you can stick the following in your .emacs file:
 
-.. code-block:: none
+.. code-block:: elisp
 
   (defun c-lineup-arglist-tabs-only (ignored)
     "Line up argument lists by tabs, not spaces"
-- 
2.39.2

