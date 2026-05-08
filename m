Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384B640FDA2
	for <workflows@vger.kernel.org>; Fri,  8 May 2026 16:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258291; cv=none; b=mp/Jovyn8zb2u3ru+AngILi/7ziH7NXZ54Fbfr3fRWxMEZ+mz/0d3AuDQG0uJQtyYHZk9SeqC4IUC9TzKI41Kxt3Kz+e7Z0wiu0D806J/NungMUBhnm64lf9uPvd1AwXGdR73rth8sj0bVPaFpNMltAft2mYW/poXli2N9SsB5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258291; c=relaxed/simple;
	bh=wNU0Th5XFAiJ7y6G8CDjt/dAtEYXDL6KcaolFhQPjEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R3wCVfgW8S416I14fN06KbpQt4XexO0LAzxJMbfzVSQany8Xo8wBWiXpu4baV9QH6chqZYFPZKhwPdMEe+qqpiXaAgeindjhFeaVEtmLYGhRifVFFJwyYCdVTwOwFYu11gDWQqVEYKA+Os0SRGApkXFWzES3Iu34q30HszkpYBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9PM+uEP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9PM+uEP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so20894785e9.0
        for <workflows@vger.kernel.org>; Fri, 08 May 2026 09:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778258287; x=1778863087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WT56FP1Bt4LcxLxZsWkK8+jNPLJAOL9nE1Hwe4/BncM=;
        b=r9PM+uEP1VTIerMwcLlTxQTqfFiZsRbwjH47TYsZJUVlNKXLHDDOZfmrrQ58M9syDh
         ohtYUYUFMSCp6IJTO/NnElsvRuLWgo+P8mXLtarBTBPhLf8ehx0B7brv2EvYQE242AG+
         vho9obhSXoyp9WFVuZ34GH5P2c6e9gGxMIzdiI3kOnL5hxhiOa51ai+N06tbP2tVVxo7
         T1sms07yGafuNEj/qprrLSq/g9TGQszn7K2jrjlTxB0YzBQQTXt17DxvgS0wpaXgaA2q
         JMd1Rv813g39HnXgD9aK5XYVDM1rmayk0CfDp8IgpFdKmMKJx7vLPy4tB6NRAzYsZq/b
         V1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778258287; x=1778863087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT56FP1Bt4LcxLxZsWkK8+jNPLJAOL9nE1Hwe4/BncM=;
        b=W92ahS9qFUWOdeYyTmjIMRceEcSe1DlmgT0b+Uj99A7g42a7SebAtE8JHDbcVjp30I
         plRuEmZPLE0sW4z0p7jBRDcBbnLbC+4iZCbZHq+MensfPE25k/kqjMadGp5XRnA9S5SN
         M5h/jUn150tmNWKHJM8iGZQ3yZlUJympisQ8/od1ko3I+d8fQQ9UR+jUNVz0qWNBSLbC
         JwjHawkxZzlyazxR+Ac2l9YB/dfTNQoNwkaSKITq5fwUz7XeCRilPmlgKeozhVeWI3en
         c4AVln5UjqR/imTvdAakT9wgzelI5sIHUNav9bxUlFY/UZXGApwfBEHV4x+rxFDvYdhn
         gumw==
X-Forwarded-Encrypted: i=1; AFNElJ/fyMMnlOO1pjmMq8p55gINYmZBlDVp0uvrRIjyop1td+rtSQ2UFVKWZizapz3W3PyKT3Vie3Vr9oU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRLAdM16pYJUEfiykL8Pgr+H+5z91Ptu4Os/B/6jMEJdO5dWb1
	Hi0ajt0RAooJplt1V1qfd3tpiFe0DaLjG1fE6wIyuTgNol0CajNXpxgT
X-Gm-Gg: AeBDieuhzAmNsmEW0jB2IKzFOXIwbxAPoQlGlMHtZfx/HeispTdO4ENXD2zo5k3/H/R
	MQxwYQDjVdKrUYjtsFGqzwP2AGBHJGe1WjEhi1BzImBmAOqxXG0M2tW1In/whJouOR9dmEn5GnS
	ayILX0f9bn1c/wUtJnZ0oRoQgqMu5tfNcjUSMOS9hhh0XIEACBR08tEVnI5vTsgBm1oOerumG/q
	3F43iVYFFRBneYIV0gnFienbdbjzPJGTVf9FBFiB72rfbTRwPBnsZbi4QdFtsqmeH3PX1vR/FCy
	PbWKnXzAinvGmYNWg614yKdRaPb5uo3Z2W+eFGcvoxIcCIOUtimmTiBQKorq5IiaOvLebtowy+a
	YqLa0gbsTqrccvXUQke7vN+Ks9sO4/5XrGN4zwBq4uEPfgwXhuRxhCppqqjhe43R4ExuCmlV+vv
	Htuk7yOOCt+ih5OzMOIckFar62wjY3QCstCiHSVLNjooyGZc/93KtgkWUovpxF1jxFocQ=
X-Received: by 2002:a05:600c:3b8f:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48e642deefamr69130145e9.7.1778258286363;
        Fri, 08 May 2026 09:38:06 -0700 (PDT)
Received: from arey-arch ([2a02:1210:7298:ec00:73f0:d2e7:188c:1f61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd32afasm6901045e9.5.2026.05.08.09.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:38:06 -0700 (PDT)
From: Adrien Reynard <reynard.adrien.08@gmail.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	kasan-dev@googlegroups.com (open list:KASAN),
	workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:NETWORKING [GENERAL]),
	linux-um@lists.infradead.org (open list:USER-MODE LINUX (UML))
Cc: Adrien Reynard <reynard.adrien.08@gmail.com>
Subject: [PATCH 4/5] docs: fix repeated prepositions across documentation
Date: Fri,  8 May 2026 18:38:03 +0200
Message-ID: <20260508163804.16267-1-reynard.adrien.08@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
---
 Documentation/dev-tools/kasan.rst                   | 2 +-
 Documentation/networking/switchdev.rst              | 2 +-
 Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 4968b2aa60c8..3a8bd40ad905 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -392,7 +392,7 @@ reserved to tag freed memory regions.
 If the hardware does not support MTE (pre ARMv8.5), Hardware Tag-Based KASAN
 will not be enabled. In this case, all KASAN boot parameters are ignored.
 
-Note that enabling CONFIG_KASAN_HW_TAGS always results in in-kernel TBI being
+Note that enabling CONFIG_KASAN_HW_TAGS always results in-kernel TBI being
 enabled. Even when ``kasan.mode=off`` is provided or when the hardware does not
 support MTE (but supports TBI).
 
diff --git a/Documentation/networking/switchdev.rst b/Documentation/networking/switchdev.rst
index 2966b7122f05..948bce44ca9b 100644
--- a/Documentation/networking/switchdev.rst
+++ b/Documentation/networking/switchdev.rst
@@ -162,7 +162,7 @@ The switchdev driver can know a particular port's position in the topology by
 monitoring NETDEV_CHANGEUPPER notifications.  For example, a port moved into a
 bond will see its upper master change.  If that bond is moved into a bridge,
 the bond's upper master will change.  And so on.  The driver will track such
-movements to know what position a port is in in the overall topology by
+movements to know what position a port is in the overall topology by
 registering for netdevice events and acting on NETDEV_CHANGEUPPER.
 
 L2 Forwarding Offload
diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
index c37e8e594d12..7b08738c30aa 100644
--- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
+++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
@@ -1092,7 +1092,7 @@ be formatted as plain text.
 
 Developing always goes hand in hand with debugging. First of all,
 you can always run UML under gdb and there will be a whole section
-later on on how to do that. That, however, is not the only way to
+later on how to do that. That, however, is not the only way to
 debug a Linux kernel. Quite often adding tracing statements and/or
 using UML specific approaches such as ptracing the UML kernel process
 are significantly more informative.
-- 
2.54.0

