Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C6F35C6B8
	for <workflows@vger.kernel.org>; Sat,  5 Sep 2026 02:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576306; cv=none; b=MTlxhXL1eB2wQWT9WSD/uAeFi9pYQ6QnKy5SiADsZsCndbSfDWgRl8lThQB50h4o1Z47lKN+XVATfhjpGhqMOA8dUznPCrene560QvmQ51iWaute5aCxfINLgatPuLkl5xEHTBtWE2C+RadmDT1zMT3yfbf7XBpSkXjhHPs4FmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576306; c=relaxed/simple;
	bh=6V+wcAi6aIjzEQtsFtZ35bhks7J+sTDymPNLuPNKj2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aWnvyoo60L5slaJglCtI3AD54eH4DMi0gKBpVKwUbTzCkJTRD7oIgVY2UQAWs2wClWLRoWcfInCdsgk95dVag8XWeOi68Ye/TUxy+u5pOAqOM6eW1GLkRMWAjfR5W/27SWUAev1JdhiwHQghpC5jvJIUl0T5+Md/tntXDDsoeFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSmaAG4c; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSmaAG4c"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso14654005e9.3
        for <workflows@vger.kernel.org>; Fri, 04 Sep 2026 19:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788576303; x=1789181103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3yyxISqKrXTZ8z7qHYkJWu3PYgeGWsbzCukGt/ffek=;
        b=jSmaAG4c2+u0n1L5uvpBWThtbjgkAcLjUe/zP1HSXq1vE3ktLb3oyRO33JIPS35Z4H
         hH8agVs4bdwkk/oLcRukGxNrxepnTd4a2XI47ZP1GN8fVS3z5mVD1ouWKihgA0CE27O4
         yRbE1EVFCbNOtB2IdihJ2PT8env5l0qRv9iRccEJmmZ2I0WFc2HLw6hynQv1jdV3mx7l
         O8o5nKpa7Odij6l32ZMAeOl7nK49wLWZw2ooW7TIQddB+djv2IXj1q/ZwvolbBKGT9Si
         5GbD5xa6NfySvnSSoGEyH5Ra5BKchMhCcRAWOKM3U6IaZAv3mj1gm0Y+IzIzHjbrO1Z+
         zdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788576303; x=1789181103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3yyxISqKrXTZ8z7qHYkJWu3PYgeGWsbzCukGt/ffek=;
        b=hSscu0kZCjkLyPNJroTtAymlGFmW0o76Cdb9jOfWsij1xfrqKONnP/zu9laA3Nouvk
         VQ8sMlmOHkoMK6MNvoWOq1AEPOhzKelpl2ESmWV1IsHcarVC5h72//R6NvBnFG2R1EDc
         EMBGEyOG/hOM0dfPwSU7FMA5RNOtnicApfK4eYd6uYlKnfruC7WkgM1SVyQjCoY0eOVj
         +Zzh6zDofIY5MwbL9L8MFCL1bqL6hqXmCEoGSMoYtR5piy8jjNq2Fd4fAyZUkcX0Ms7z
         2ff4dRlLqZXeV6csVYfy8l+ORkOWO+h8nsIgl0SFwM/JFBwnMYGAAXL9GAPFWnuCtbbX
         reyw==
X-Forwarded-Encrypted: i=1; AKwUvByH9Pn3/60/S2dwQChU0H2fyksnc1tobvJqgwnIX/B6MxD4HrAaycbaA5sh1kfPS1wSZsKTg2w32Rc=@vger.kernel.org
X-Gm-Message-State: AFuF++m36FvmaGy7rgFgrfn6cv+2vtRrq7Ch4VZ5wCkNnRkjM839xrP4
	OyyZoRillVhB/tlx+fVESOUVT/F5hBROoXTx6XHljYeYUEEyrlBZ0j60
X-Gm-Gg: AYBFou01nQkumJj3wz04/tsagvgGzsQGqBmrNGVMSX4tKgdGTBiGZuF6FU/L9njAq5H
	fNb13QSiMnEGOs441QuMPUHV05ApGlv3a65PutgLdQhFcqwcRhWP2DJe/E6D2pajWgiuxb8ZnAU
	JdpIu7OJ6pUU+6VckR2xT22E98QjwAHkTXWw/pTJ1l1xAnJ6hlLO17asS49Z8ZuZBT8u/RuhwXu
	Zr054TTrtO/pr6up86OXRnKvzD2pFFC6kQuTLCbuLa0Lus1bppqDUVlBRRi3nsUJhqC33yjgVnR
	n33AM8lrtvaRHcRA2+Z3sbykinpDUzDJJICKE6H46ZmnbFeLXud6jageTlgb9PN/J46jnPCUIi6
	VYTyyeivRgc1SiSKOgEzyzss+t68DzXlszQqDhneZu2aW1RLPMVoHv6VJ8iaGBiPvNav51PLAyf
	4d0zA1XBqTXUSB/cZtniUOyKMHwOLJAuwN2QAspux3IddyezhBAtKpj4EsL1WoYt16DkTn4Pcxp
	aMO/LvBFXDZ+IVa1E9MjXSTYyx5u0o9LaUc/Lv9zm6fcClytYW18eNK3V617RbkRYfRkIy2IRt9
	xQxd91g0nlpDAAK5zFDbu1zQsL8nr8TjXXZtlOccotBd6rCRIglhnYK9FO0dkOHCEvs=
X-Received: by 2002:a05:600c:1986:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49cf825cef5mr83527625e9.14.1788576302692;
        Fri, 04 Sep 2026 19:45:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm10052560f8f.32.2026.09.04.19.45.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:45:01 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sadiya Kazi <sadiyakazi@google.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: KUnit: Fix qemu_configs path
Date: Sat,  5 Sep 2026 04:44:55 +0200
Message-Id: <20260905024455.83413-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The example path is written "qemu configs"; the directory is
tools/testing/kunit/qemu_configs. While at it, make the verb on the
same line agree with its plural subject.

Fixes: f13ecba04bab ("Documentation: Kunit: Update architecture.rst for minor fixes")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/dev-tools/kunit/architecture.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/architecture.rst b/Documentation/dev-tools/kunit/architecture.rst
index f335f883f8f6..dc291c6187a7 100644
--- a/Documentation/dev-tools/kunit/architecture.rst
+++ b/Documentation/dev-tools/kunit/architecture.rst
@@ -167,7 +167,7 @@ Documentation/dev-tools/kunit/run_manual.rst) or use ``kunit_tool``
 - ``configure`` command generates the kernel ``.config`` from a
   ``.kunitconfig`` file (and any architecture-specific options).
   The Python scripts available in ``qemu_configs`` folder
-  (for example, ``tools/testing/kunit/qemu configs/powerpc.py``) contains
+  (for example, ``tools/testing/kunit/qemu_configs/powerpc.py``) contain
   additional configuration options for specific architectures.
   It parses both the existing ``.config`` and the ``.kunitconfig`` files
   to ensure that ``.config`` is a superset of ``.kunitconfig``.
-- 
2.53.0

