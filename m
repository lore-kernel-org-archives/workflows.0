Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3439328B71
	for <workflows@vger.kernel.org>; Sat,  5 Sep 2026 02:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576695; cv=none; b=ZsxD9J1WfWeinCa6FX09PGDXzJ2+lsM0Yp9CM6SQTlbgT2/c2KE2wXMQPg3+7NO+rOSCnlCc3FaUvpHrYjRMB4gmCArKB+Wndi6rda+6aaHDtLAmUj5wb9aCz1DT+bDIzZ4rKZdlKs6JYuc72M83UxQfm7QFBzqH0vHtS+gCl8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576695; c=relaxed/simple;
	bh=0oDNB+NNpmi/Ia5UjiAAkWEUmzFeJsRXTEAWNh6e61Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lN3cSSrVZO33z+SFKMhiiYt3/PDOTY4IIeAsNshX8cP1x2374YoZtgxI4GJBy90kVegI6GlEJgf5ITG1wOgEUIDbswHhBNwCxRdYpFullm0uUXTk/TFsS7rgvfaTztOYgZu7m7dC5wJ36gV3BsHStLKPbzzZUu18tpJkig2pq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZYXIZwx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZYXIZwx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b9320423cso18048645e9.0
        for <workflows@vger.kernel.org>; Fri, 04 Sep 2026 19:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788576691; x=1789181491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7My75hWOIQc2thwMD1HFJppKK9ULfChR8ooEsnbLug=;
        b=MZYXIZwxo83oWGZmBhCE7jrDgqzAHjLHYUeJ4DYSrl6Djz/zts0RsT+68tVmOUH3zl
         rlQuk9KaOvxdZWWHUIzqiaUVhblYwptMIx1lj1QmgiQ8T+GgEOhFyOlEsPDQdYhmh8bH
         mp5ZsbQw6K/4Mzr+5GSx6qia9F9jwZCGUFOscIe04S7WK7VH7uP32iM8vPOZbc6LzpEC
         npjs+sBu3XV+v7uF045QkdrZ1u1Noj1AIafN95oQGHlcEqy8Eegixu3A8tlObLb61O8D
         TRheXGxsJRWAQ7PhyP5ZoEymvceVzIvY6jHb231772+6UoQZz7XT7htMCkjQ2RbhMYbD
         nfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788576691; x=1789181491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7My75hWOIQc2thwMD1HFJppKK9ULfChR8ooEsnbLug=;
        b=X1eDMyeSVLzH2oZomr7hdYtBh3bhVyQ12PbAk6fRmZA33ARZYhU5qorNlrSrBqskdx
         x5/e4hJn91dSXYv/q9na9Dvo1xoJFZOxyu/aPlbb3qFzOGbDJYKFOfN06oWhIffHS1ID
         /RkG3onBV7jeRYVrjw5zwsw4qYNo/yUcqqNwkpLfMF7pmVVs8gkpnRp2cmtMeBwpPg/2
         D0yUp0nbOrGoNKhGLtMLrgzOIoXbQjX5WNDqZSydTjdF0qdS3QebxJaoBNMcER/hC2QG
         usCYRYfyHt+D4IKcv2CsF4TsCEV5Enc66gyyvY9uCNFSdpChhqPCobhOw0SteM5WMBzQ
         eWkg==
X-Forwarded-Encrypted: i=1; AKwUvBzh4U5HtJ28vVQHicMsBUiFMPcrEgVpJP39wV7BF1GFlrqtUELARsM+d5vkqVZWMBZL8T7rXgIk+NQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lakCT+14WOXGZd4zD73cBbCDyuWV1/d2PqGaOep9H3rIJY9kSI
	xvxza0FbCrHOxWEt919dVlu3wVABelfRXBD4SnuWEJyycY+KckpFeYER
X-Gm-Gg: AYBFou31F4+guZJplwBn0mdwP564A5k8RsQYD7QP5c7caR3YuTG1+Faj3vk7hlLElzq
	fd0K1xvlJF6bPSafz3aiB2jCQFcfGNOaRz5SMH2RC73p/iK+ed4kLwl6LX95Z8w6azDUDKvUIwv
	LAoGMzDMucYmoqPxLMiAnMHxgBeRkv2L01GG84Gcefo0H8DJU+Cz5fa1GVeIR9J0bOLL6UT+wGn
	WfOjYlhxqIDigRmyN5ZrZdpvpD7Uxy46qtCqO04bMFEja/PUonjeZkFsAceKagC1w0+IqXExRO3
	YT6sZnMjcGgOO1U7q3qVL1efTWrSLVyju4i6h5IUoLtjEDlXSUjVi1gUN2Q3clgtlN3NNDMHsfx
	xleT42BV0YiYX/ZJkRQUflVOw/GZQLDZIObFCYrNty4rHPp+3+r5JaiflfG9jy21YJc8sPyuLWC
	RfZl27ma+j/F0EOXG+KM3fJ/SYlPtE21AqMX6XtrfiCPOls2qh2cMbwWYhAdRfMExESq7FzKP+1
	dVYKZpgKs7abeGiyKRCPeDZhM+flwmK3Z0XXYQKq9/1bfhTtApZeDn+nT3wQzSm2OxNHFjJhXQa
	XCaW15uEzueaWG/70MzSuM58pdAdI7nAgeANVSA7JfT4W+ovYuzsDV/2oTeul0Y3ryY=
X-Received: by 2002:a05:600c:3485:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cf825c119mr197015325e9.16.1788576690772;
        Fri, 04 Sep 2026 19:51:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm200740735e9.4.2026.09.04.19.51.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:51:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tim Bird <tim.bird@sony.com>,
	Harinder Singh <sharinder@google.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Daniel Latypov <dlatypov@google.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: KUnit: Fix cross-compiler prefix examples
Date: Sat,  5 Sep 2026 04:51:26 +0200
Message-Id: <20260905025126.83693-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GNU target-tuple prefixes shown in the CROSS_COMPILE examples are
missing their trailing dash.

Fixes: 46201d47d6c4 ("Documentation: kunit: Reorganize documentation related to running tests")
Fixes: 957063874c76 ("Documentation: kunit: Add CLI args for kunit_tool")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/dev-tools/kunit/run_wrapper.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110a3399f..9221acddf3fa8 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -189,10 +189,10 @@ via UML. To run tests on qemu, by default it requires two flags:
   Kbuild. As a reminder, this will be the prefix for the toolchain
   binaries such as GCC. For example:
 
-  - ``sparc64-linux-gnu`` if we have the sparc toolchain installed on
+  - ``sparc64-linux-gnu-`` if we have the sparc toolchain installed on
     our system.
 
-  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux``
+  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux-``
     if we have downloaded the microblaze toolchain from the 0-day
     website to a directory in our home directory called toolchains.
 
@@ -293,7 +293,7 @@ command line arguments:
   - ``sparc64-linux-gnu-`` if we have the sparc toolchain installed on
     our system.
 
-  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux``
+  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux-``
     if we have downloaded the microblaze toolchain from the 0-day
     website to a specified path in our home directory called toolchains.
 
-- 
2.53.0

