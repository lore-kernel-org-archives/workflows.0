Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8A83A9DAF
	for <workflows@vger.kernel.org>; Tue, 24 Mar 2026 06:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774333235; cv=none; b=AXEo6Dt4iSxayHd9YksqNH7T7FbnHjSfUZbbgDl0igXzudU/BHsjZJgFmtqmd181OU0E+I+YBHEe6LERi0fhNox2kt8UCrTK6LyB2jB3sIdGCY/2IpL55CEJLJZUp6Jipx8acDEhKbp9mSGYI13/cNAGYGi8MdziHIwdK/0rtFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774333235; c=relaxed/simple;
	bh=7b1aDTSE0qRQSk30U9x92MpkGPkxm8eaUPvv8l2E0Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V8ZiXlpYOods1OWjc87+QWUTLdhcojPwOy1An7JVYhL0XF+vmQ3fhHBJxFES5y0LasTg+RUzoL6+eM42OHg1/uhhJv3PKrW4XJPRJGCf3SRpU9oGvvy8mnyfaLZOJY5Tuh7+ns+T6xwVdKORuGLI+C8dh9LEfXxMG8Taa0y8Jrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ets3LISb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ets3LISb"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35b97ed057cso2196084a91.1
        for <workflows@vger.kernel.org>; Mon, 23 Mar 2026 23:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774333234; x=1774938034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8tWMba298e2gRxfQlq4zFMDhOWDqH8fZHMm6s7SJDP8=;
        b=Ets3LISb6w9SkWBs9LfK8gUovSeJxWTJfXngB01ZklhV2wFXtQcZlWpwB4jElnsa4h
         f3Y/2N9/FQZ05oEcsK5M7veGxekZiQPtJCwQjqd4s+WV+7LrO6tu7JD8aaz6egQZr/9e
         B6t9b2A9hcNOOVGG/K1NfxacJH6r1flfF/IqfQxEovRRlSoqM9y58tIe37ugT7vXcA70
         QfZsMW+hMO4noiJB9pb75DkKrQjt3ad9Tr9Vl8D4izT5X3zlGcgINp4wKGUFfcAirSAT
         5la3G/x/DxZBDEiTjwPGzKsK5VA+yBgKzYv6priIX1kvj1CO6/o37txqibUVQu4kIwz/
         DTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774333234; x=1774938034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tWMba298e2gRxfQlq4zFMDhOWDqH8fZHMm6s7SJDP8=;
        b=UyV83MUQ0PXK9/CM3gn3yYUnMKh3RmK8kYSPaJTCSzkdiObv1WkOgiJe8qZ/wCZ2QP
         qiZ6e5lY0D/Awcf9P9bsd0fo1RpCkG3gwQBfSpwgmmMV/ePi7rSsgpw/8wxH5JsNZxlM
         VTxEieV6lmPuGJhCXa4jhZGRQML85eV8Ed52wbNKc2JkCEwtToOxlctsqCutRf20D33X
         Gi9xnTuf9KRQSm5/7LWK8X/txtaBya1Encn8tu9CIyDiN0kXGzhdia9ZwJbN4tSEGgvE
         kGOs7EixxaJ9xFBW4Mc0HJ0l5Lij8PggPZLlUFSZP2uCexO/pfBFzT0P0/ISevJGiirs
         BiiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv7toQOgtAic8i0x63gS4GTOZJJu9qm/EIQAxR0KI/imzegBYYzIws97tRL/v8hcvOEL5kTteOIh8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9eVKOcxNlk0iKnswkwwGdlnvxV6qfOAfqTtK/iy4JnEWJjqoS
	CCZCFaDVAh3jxcRlrHXm4TRHnAVPHX/RenoDSfSHrJa8ThRsGiSGftCJ
X-Gm-Gg: ATEYQzwkg5PLM6wSzFWSDO7ZFCtPsLpAtx0F+PO6wc8C6hBT7lQfZsKYjWn5ZlMlpaw
	KHQNCQv/np1LL+m9pAXEZ3jVU1bug1hUoUHCznjgl7w8NXdGsWgXfnkR6JDI+gr4KU+xWMbuxcY
	wzAuXXerwUEiO1lRj786BaGcfLSI+7Dk5wrKjlsPXecsakwTzDwIDlvwbxYWKeX1FrDw7MniktO
	2z3S70DGu2FXm49/enurxmwmuEe9FkSHnzbUjTdWm0BJQBcT6B/f3agw97EixiTKla1hvWftUFq
	ZMbZtKdP5HlPZjbPZqWhW6UAtIZ3/JyO1pHBPhPkcfDIEP6Nu/wSc3VJlpQ4ehxi+DckJKt437J
	1HBF2nnkuBIlL/FyWYGs4+Ya2Xev3HmvtljhEswh/s+Rj4ly9mSUp9s2iM1Uwlh8QhKLS0dKqXd
	RQ74/SEMSclU/vn9yYbEtytGp9A0VPD84AoosTqS9w4m3ETgSs/WXWkihFHLphFXOdCSNbyvOTi
	agsrnrCwjY8hA==
X-Received: by 2002:a17:90b:5107:b0:34e:63c1:4a08 with SMTP id 98e67ed59e1d1-35bd2c98e30mr11242780a91.20.1774333233828;
        Mon, 23 Mar 2026 23:20:33 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0312f1cbsm1091367a91.4.2026.03.23.23.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:20:33 -0700 (PDT)
From: zhidao su <soolaugust@gmail.com>
X-Google-Original-From: zhidao su <suzhidao@xiaomi.com>
To: Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	bpf@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	zhidao su <suzhidao@xiaomi.com>
Subject: [PATCH] docs: Document pahole v1.26 requirement for KF_IMPLICIT_ARGS kfuncs
Date: Tue, 24 Mar 2026 14:20:28 +0800
Message-ID: <20260324062028.2479059-1-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole
v1.26 or later. Without it, such kfuncs have incorrect BTF prototypes in
vmlinux, causing BPF programs to fail with 'func_proto incompatible with
vmlinux' error.

This affects all sched_ext kfuncs (e.g. scx_bpf_create_dsq,
scx_bpf_dispatch) and other KF_IMPLICIT_ARGS kfuncs across the kernel.
Ubuntu 24.04 LTS ships pahole v1.25 by default, causing 23/30 sched_ext
selftests to fail on affected systems.

Document this requirement in Documentation/process/changes.rst so users
understand the failure mode and can upgrade pahole appropriately.

Signed-off-by: zhidao su <suzhidao@xiaomi.com>
---
 Documentation/process/changes.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 6b373e193548..141a4576c24d 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -145,6 +145,11 @@ Since Linux 5.2, if CONFIG_DEBUG_INFO_BTF is selected, the build system
 generates BTF (BPF Type Format) from DWARF in vmlinux, a bit later from kernel
 modules as well.  This requires pahole v1.22 or later.
 
+Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole v1.26
+or later.  Without it, such kfuncs will have incorrect BTF prototypes in
+vmlinux, causing BPF programs to fail to load with a "func_proto incompatible
+with vmlinux" error.  Many sched_ext kfuncs are affected.
+
 It is found in the 'dwarves' or 'pahole' distro packages or from
 https://fedorapeople.org/~acme/dwarves/.
 
-- 
2.43.0

