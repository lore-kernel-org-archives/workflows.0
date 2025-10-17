Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E78E2417DE
	for <workflows@vger.kernel.org>; Fri, 17 Oct 2025 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733464; cv=none; b=Z6ISjC4TA8bVtxsSGg53opYCFc7F9JyN2GPiGXNzrEfR9Nhh49FWkbI+hUwLVpNd4BAqECG4ZANfo8KbqLy4ViKTEVFgJHapi+z8Hugvli0Q0BZFiqWPB9lKIs/dpONLasbxx0R2eXXnPCdQaTxn/RpIbpU6RXX7w+FyisBG2wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733464; c=relaxed/simple;
	bh=MctnxTuATai4l54nWLFKFelAF8yZCCN6uTLE/mlmEHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XdguKzC9Q/37QugjYcIKEqUxsmZCXKnwL2vx5Onon0G3pW/XP9soNplM8091X05mQibvZWGuTtukdW3Ku/NV4HY68+XhOjaJutpu1tgxB14R5+TRApSVdqKiBt7GeVYUJopKRHOnVI+flH+Gggua4pHWcRfIMuokYRSFjIPHZtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gqI4ABPY; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gqI4ABPY"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77f343231fcso1619104b3a.3
        for <workflows@vger.kernel.org>; Fri, 17 Oct 2025 13:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760733462; x=1761338262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZeBq3Lk7BVfi39KwhzSp3L/wgMnqHyapiXXWG829qc=;
        b=gqI4ABPYZ4QxRCc4QY3quTX9wWdAeBGRG4f2PXIHFN3czNr438NrTWUk8dW6xUs91Z
         IqDmV28cJc8njMpB0h5e6xXleESDsYjrODmGS6FduS67qsKnILcQCObgOz6J5Q0PJ0SZ
         U1p4pUfI6fQq4zt1eEvwMffrKUtyF1tfAfGDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733462; x=1761338262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZeBq3Lk7BVfi39KwhzSp3L/wgMnqHyapiXXWG829qc=;
        b=wSyyonhl9TBbaYBeVwoVcqpDkb/92xcPQus63WJVTskFxSRcUYc3yKAk7MlqBLbewQ
         eYgxmbMzTIKDo87jsL1Iqf9sVU0zvJF5XrKbxlnYnJP0DOX0mZ6/WS0cmmkU65lVyAve
         zbf1M4vw9zI6f/xjRnfgtKCFnM/ORCPRzxld7LgIjMF6QjgiVJWwAY129lCUfAOfuAE8
         +ttlRYDbOeBiE+WreObDByFSW6dufQhCL/Hwx0ujIzfwpkeAZAJZ5vVvg3yMRvmxBSMd
         SsyDpjQyy3BHDctwRyut9jSxh4ANLNf9pwFn3Kl9zH5wy2fwnYWITDV35gGGn81Maymw
         y+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGoQIKnXU95rGlZwvezjuFtf0eexx7L0unx5NkCn7cZFr7PwIhmkb6vqSvQL1E7/BjSJtINVKElXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRauJsQPIw4JSEmZWmEUF69y78oItI7YU9SOMMrt61LUOCpqvr
	m52prCIvSf3xRHlbzcuUkVqn7cdi5ldWrhUJFsy/NR8kDne5npu/J+fnDDyiqdRTkA==
X-Gm-Gg: ASbGncshw4TGZ8xRw0CIFlm/eqWfFhqDufuS4EVizqf5pheSP+p8yYgnNLhrKUg5jM0
	XwmdCYlrdBHonh++1XIBi2810NYlPVhnOwlGJ/Uy3OCo+ZFtXYS9pVKpN8+sLew3BhxH3/xzWKV
	ZGL3kkdC+crSV5RoLb67ZPlsyKKIDouyWwb6RdGU8TCUvXwEbQX+ndQLTdC/GHR1STyBaHgOjOq
	isav7+dhIPxyNDIjNBal2udHRMZrolf2IsI/sPIo0jhy2EZZ9lV4lwexftiXEOABKzjezq96uxj
	hlCv7PVeT0/bad5zzM88AFEP/FcHv5Sd12bR3D0a5Vm+Gdp7tJqLc5gNeAT4IEq4C48Gy9N2Y/Z
	+RGwy8xgw2NqBoSswUctXBhZrBWxRjOG4ujauZgcR8HzQLKXv1/1E8miwPLVfhZDO7CwO93sZiD
	NnxEtOEoXJH+KTsK1rHGwRpd6gLP4ZKFSF32jUxQ==
X-Google-Smtp-Source: AGHT+IE/YYS3o1+JuvtET9j/q+byOk9MK+q6kmDUXS3KntYy67SnJd6kX1S96rUUu+Rtdegc54AW9Q==
X-Received: by 2002:a05:6a20:2590:b0:334:9fbb:35c3 with SMTP id adf61e73a8af0-334a862167fmr6473965637.46.1760733462564;
        Fri, 17 Oct 2025 13:37:42 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5ca9:a8d0:7547:32c6])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-33bb65268b1sm2837858a91.2.2025.10.17.13.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 13:37:41 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 2/2] docs: checkpatch: Drop networking comment style
Date: Fri, 17 Oct 2025 13:37:12 -0700
Message-ID: <20251017203719.1554224-2-briannorris@chromium.org>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
In-Reply-To: <20251017203719.1554224-1-briannorris@chromium.org>
References: <20251017203719.1554224-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Networking no longer has their own comment style, and checkpatch no
longer checks for this.

Signed-off-by: Brian Norris <briannorris@chromium.org>
Suggested-by: Randy Dunlap <rdunlap@infradead.org>
---

Changes in v2:
 * new in v2

 Documentation/dev-tools/checkpatch.rst | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index d7fe023b3080..dfaad0a279ff 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -465,13 +465,6 @@ Comments
        * for multi line comments.
        */
 
-    The networking comment style is a bit different, with the first line
-    not empty like the former::
-
-      /* This is the preferred comment style
-       * for files in net/ and drivers/net/
-       */
-
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
 
   **C99_COMMENTS**
-- 
2.51.0.858.gf9c4a03a3a-goog

