Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AA813B2A4
	for <workflows@vger.kernel.org>; Mon, 27 May 2024 10:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716806240; cv=none; b=J4x0+7CdjZmg4tD5KXTYFhZWWfGjNSwWSJMTXlbXsHUg1mqAg4gRc/+p0UjF+OwtHe9zSX8O83i7PPF28undXyF3u8RB7oqxGk0SCqqSf4rr/Wwyk+iXu49PRSy/Yvitx2r7hKojy+w+nblRfc+Y/LiyW8O7zezzE+r3AOC3zMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716806240; c=relaxed/simple;
	bh=BGmd38XxGSdKDMMcN3G3XiQIcyOv9DXSluGqtKQy9+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VdKe+ZkcSvBdZEEi3IyUDRQY2oMXZqS5Hz0dxOcDZwHHacT7PUuwEncXxlE2yJU7FAC+RCzAl5j+epBvaQNOF0ReLi79KXBiDqlcLB/zRP/PbzRNMQw3vidUtTmooA4coerg5sKfGBQFnQArs5KDbRXe0L6l46GsZvB3UpXpaag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=nLsveh6t; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="nLsveh6t"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-578626375ffso2790086a12.3
        for <workflows@vger.kernel.org>; Mon, 27 May 2024 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1716806237; x=1717411037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dO0AvFL5QwePC2QZ3gqTYDM4BcsHQKgOykoeZh92DyU=;
        b=nLsveh6tAbZJL4bicjOJ+RVpjPLj4fH507GnAWwY2BdwXg/C4CtH7brjzp/AE4ISLM
         OAZwBDKo354WnSasjw+SVTevql+5gTWy655tiuou0W9EPqpQLpjXRyl29/bRaxNY6+PZ
         oqoJpGHQ8epYzwZ/Skcd0KhZeiRR8WPbt7FdRiI1fGrLpZSCwEHluYME3PnsQjm0NZPc
         Gz6i5Ucv9WwjZvmB9uxWIFHTl8l5p2GXWloug08NtpcqVlSjE7fZitPH24gp3lIh+5BC
         /y1MIk2IzmmcebQ+OC8VEDfG1RUzecul+Dubj0kxINx0vP17x9Ir8/1BhHVWO/MAPFgt
         f1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716806237; x=1717411037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dO0AvFL5QwePC2QZ3gqTYDM4BcsHQKgOykoeZh92DyU=;
        b=RwT4LJpU4aYFCvZXYfHKuPemvPK3BlJkZzh/M1q91KxlcDkQagdDCRRNBqBcjQgiY6
         JsH+urCJAfe0KhPwgAxKI7Otj/0BsuyT3yPVRtbsLfULcS9rw3QiYBmmtDkoNSjnF3a/
         fHwpho5eEINE+cpjHpQDLSQX9aG3pAbVZFFl/yx4OSqwC/FrYoJ+ydCX/ful7mPsaT1/
         2qMWaCTZ+EtaGx2V+Xzv/Glzuv/6ynrDxXWLy6vY0j0qg8CXbrCf05muaTEb+4mZZ9Bn
         XD38l48Jkp+0c4a37rbOVvFkJvhoLlZW+xU2nKaWxZFKJ8iTw83Rv77oL929zH3EqVb3
         HNvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW180BXhGoLt0kvDP/EUTZnCbF87cOa6d++gx0YSDO7zVgHYIGQPLmaFtz8iDLjFNVbvLdQgvoS0hh6kQHF41hOzavCvBwjp7Y
X-Gm-Message-State: AOJu0YzomadDQlI0v+N5KMFK6VSM//dcqLxYGCAOCw2LZLUFIal4gw93
	6uRay/LrBCcWfzO5hrizFiDAFEr0FvnPFILzn10sMpcerx3NCQgrNX0g98QWi5E=
X-Google-Smtp-Source: AGHT+IGxcPe6uT4yc9jWNU7ehZJr1E6b4aaoClrPA8u7hsmcPOTrwWBbPYZS8ijvvtGcf2XiujMAjA==
X-Received: by 2002:a50:ab5a:0:b0:578:6c19:4801 with SMTP id 4fb4d7f45d1cf-5786c195f95mr4162253a12.22.1716806237244;
        Mon, 27 May 2024 03:37:17 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-100.dynamic.mnet-online.de. [62.216.208.100])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578f47126f0sm3208478a12.91.2024.05.27.03.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 03:37:16 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH net] docs: netdev: Fix typo in Signed-off-by tag
Date: Mon, 27 May 2024 12:36:19 +0200
Message-ID: <20240527103618.265801-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s/of/off/

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 Documentation/process/maintainer-netdev.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index fd96e4a3cef9..5e1fcfad1c4c 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -227,7 +227,7 @@ preferably including links to previous postings, for example::
   The amount of mooing will depend on packet rate so should match
   the diurnal cycle quite well.
 
-  Signed-of-by: Joe Defarmer <joe@barn.org>
+  Signed-off-by: Joe Defarmer <joe@barn.org>
   ---
   v3:
     - add a note about time-of-day mooing fluctuation to the commit message
-- 
2.45.1

