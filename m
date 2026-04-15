Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27013D5255;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243150; cv=none; b=Nta84W5cmpKP5RC9XTgSAHAq3BL9WYrIgpqBNYb/7szc2rnrOJ9f3zKQgr/layufSX73T3Lxdyg7zP/3OBbkgNP6GS80qTnaNwqD5OKraJbcE6yEwxRiG3xtWGt5STo9/uIMlT9pV5bcvsTDh1vNXc8Zl8ClGjhEBXTxhmmZyAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243150; c=relaxed/simple;
	bh=yhHzbQrXLXYtWB/ywVwFbSxzVS5ND+M7WVXUQWu6cT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fOQIpaaBuAWZDGz0p+9QuTTZHBmsOmrS6Gu19KEpz8jHYc35uUTGHeRcLPSOKRAGEhchtn+0GnWmsYbt9ciNc+DSqwd/u+OrLBpHEnfoHvcZtcveAw6jaFxab7k8E2d0WMwwlX1QUWlobC13IKmIofNMkCk3tbBxONGm+CKF4KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9Ta/L36; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9Ta/L36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925B7C2BCB8;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776243149;
	bh=yhHzbQrXLXYtWB/ywVwFbSxzVS5ND+M7WVXUQWu6cT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c9Ta/L36wPR2nkPiihUI7qToFa7fXWKVCcCXv+WT7Gsuf5Cq22Ze3fIOlr/ugLip6
	 S1Ff8bAV1nysfbf2YBiFUXm3bkkuwb97YOb9xB3vlux0cckGB4XJlgDjLftf0vrcr5
	 kMW2BGElFq5GsMpbNFnYTpmCAOwMfHdoy2Z2YyphJkeOu4JYph/brtz1JzeBmdD57I
	 Qugqg5gTX2/5r9LtNwZ6gdDhpyuq+76YuypHBuhxbqdNXn16YgWBI0gV4WlHxfMPnW
	 Wg8B9dl71vAPM3hXvUMwDfJ4MP6RxB1uEaN5NHoZZZOkwYsohsshn1Un7mAPTE6/tM
	 4MZeQS6Oz4tAw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCvz1-0000000ELva-2O15;
	Wed, 15 Apr 2026 10:52:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 2/8] MAINTAINERS: add an entry for media maintainers profile
Date: Wed, 15 Apr 2026 10:52:18 +0200
Message-ID: <3582b8cbba28e014d27ab6b25a2361e6e2590055.1776242739.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776242739.git.mchehab+huawei@kernel.org>
References: <cover.1776242739.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The media subsystem has a maintainers entry profile, but its entry
is missing at MAINTAINERS.

Add it.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f0b106a4dd96..620219e48f98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16115,6 +16115,7 @@ S:	Maintained
 W:	https://linuxtv.org
 Q:	http://patchwork.kernel.org/project/linux-media/list/
 T:	git git://linuxtv.org/media.git
+P:	Documentation/driver-api/media/maintainer-entry-profile.rst
 F:	Documentation/admin-guide/media/
 F:	Documentation/devicetree/bindings/media/
 F:	Documentation/driver-api/media/
-- 
2.53.0

