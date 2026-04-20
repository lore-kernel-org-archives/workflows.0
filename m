Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720F239C008
	for <workflows@vger.kernel.org>; Mon, 20 Apr 2026 11:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776685569; cv=none; b=Na6yZSNMoj6ZdswY6og7cRoechg1zqN3LIVyscIr2DRcAogVof/3t1emKZkiIdOboVMQuVCuTgWpZiExG6bJ3ipLaQwIgTmpRnMWAk2S4lNwHnl3Lc4pOKUABHtwGO4HreEgRT6DGQCU9WP5NeEHbndj8lvn1GEJoLGjB1qYrt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776685569; c=relaxed/simple;
	bh=e0AJAUNOmNDd6/YhHvW3gryjlpU5u5Opr7QfNUASCWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RY0mHA21kDzvI8oG8dNK4c/p+HE2KTWiBCR9OPmyfuiMkvy2Xc4mJ8y1+X/sxYef5zFC81bGc3UVR+qopH1CQk+XOvckWWICcdL6WseI3rRWBywbD2/re3KW91f/1Fytb0QuqVyZHYI/RGuJh4mLuwI9X8VX5jMfm6CGUN7jdak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8pZ1/um; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8pZ1/um"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso1869307b3a.2
        for <workflows@vger.kernel.org>; Mon, 20 Apr 2026 04:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776685563; x=1777290363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9QQ2J1q7j/KIwNXKtt8cG0N80aWhIRJXk717uRg6Vhg=;
        b=P8pZ1/umD/WldT+HMUn15g6iMXiLOUNWhP+2FA7mDoS207yeBRUqGairgx1Ot8ylqu
         /+k/3MnxT3kVjwX2cftuTkuwJcM5onuk3/7g04AykAFQggBhg27ftp8ytTZz7UKoczaU
         8OoGAehv0oRgu7sOetgfCgVobUcqrohSdOYH4S5HcAgUOXAEkKqa21WFJSL+BZtVSpNb
         OBRK28mX8dFyqsfigbWxnGynwnaJ9fR+yWnaTNTjcctpf64Flis+Ma0RPPJ5yqR7xpU9
         TFuu07SUnontNZeJ9VoNWBHrfAjVvrIkhqhyWmmZl+0rqrbekkR01/Y75aOIWm4Guy8X
         Ihiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776685563; x=1777290363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QQ2J1q7j/KIwNXKtt8cG0N80aWhIRJXk717uRg6Vhg=;
        b=ATPJ5GtycOKcan10p63v6ES5dFdPab5zdBnGZdlgKwaWp6RLTYhK0lzC/AbPB8+xKT
         tHnYJlArd1eIWJ80reXbQdmz4lz3z84vVYjKl9lmEglFNfHxan8EbwVNRusQ0YvZynWZ
         k22lMOAwnVfn8YJq0P+om8w1qfVTdo/8uFhBG7H72v2+cqZStfI/7Y2kyzVdpPKOuCRe
         K4Z4+0FJgYM7MW34r0aLJyM4N+SDW8F4XFh75O51jAQ5B5htEsnTqKciVwlbhmgbyMfa
         1Nc+7XzMCrpO0MrR2lj1Q2SAg7X1ZnFqzIhpWmy8Ck1UVByHCqdZqTKguzMfWPd6NbZL
         iaCw==
X-Forwarded-Encrypted: i=1; AFNElJ+kXe1OgY5IL+JdoSvKm4uZWzSvfYL3e7tVjIiWTUBf5dW0+VGEfRaC2FTKtOjny2/mRn6jhgULJxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBDjcHbYh5hV4VhY8V6YbbUHG1YRKbTrz8woysS+JZLuj2G2TK
	ft/wABPmYIz8FIlK1Ue3EeCyqyOk4UL6508WX0j5BktGIgoFNyliNKLfHi1hI4zg
X-Gm-Gg: AeBDievBt1aw18eqiVsAJQA795Rx4BVntbBFZ26avPBrbjzBPrh4TQu3/gOO1SfRawa
	yjEhJn7cWxWBcsYgYM9jWfZcyGNsEhMEU4vksJEb0tfCVKoOrmSRvfLeziZI+u6l1Oah1fkyrSl
	vydxZLGWRueOiyDON2du7vk/rBmwDv0E1B98vcRIj6LJ0Fv48jhSfpGQzDzBQ5ldb6aWHjaeUui
	aKbB5kCsrS5LOTFM0wxVNFo98dbq4eIYrFF1Hnnd+jIHBU42N5YH5rzFf40QeIxJwzdhlyAC6AO
	kPSNrSRrTMy1GZAMdHMAe9tbWim1Llpojp2QRNqem7GuqK3n01VSA2jhkU7xOi6MX+pHHhBC++c
	S1Y7vxlTKMHzWRM6oS6Wb0AK6o0COL/+M5k+3lcCQNRG7oTzdZ0Kum+lKdTbo6drsj2ANjqweh7
	62xHtXOojR3u4IXeX6XoXs4BiVwQVqUYVaphqPNVr7fAHgSQ==
X-Received: by 2002:a05:6a00:4b54:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-82f8c93d102mr13145150b3a.39.1776685562678;
        Mon, 20 Apr 2026 04:46:02 -0700 (PDT)
Received: from localhost ([220.247.131.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm11598567b3a.47.2026.04.20.04.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 04:46:02 -0700 (PDT)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] docs: maintainer-netdev: fix typo in "targeting"
Date: Mon, 20 Apr 2026 17:45:53 +0600
Message-ID: <20260420114554.1026-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake "targgeting" -> "targeting" in
maintainer-netdev.rst

No functional change.

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/process/maintainer-netdev.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index bda93b459a05..ec7b9aa2877f 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -528,7 +528,7 @@ The exact rules a driver must follow to acquire the ``Supported`` status:
    status will be withdrawn.
 
 5. Test failures due to bugs either in the driver or the test itself,
-   or lack of support for the feature the test is targgeting are
+   or lack of support for the feature the test is targeting are
    *not* a basis for losing the ``Supported`` status.
 
 netdev CI will maintain an official page of supported devices, listing their
-- 
2.43.0

