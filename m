Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEEF3624A6;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406287; cv=none; b=eYmSfMQ4AKYffGqxl5gwiwRazkyI4ohnx5uk5zx9caWAMgrXCcQ57+fEyOc0zet9eKHs1XKyHwm6mgjAbgSH4zIFDqRbXwY/F63K+LIM/Vu0ZX3NBpuPrHfqfOsFyeK+xJ27htb2DcpZRzXL3FeYKz8udZn6vBz40V9DekYNYBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406287; c=relaxed/simple;
	bh=yhHzbQrXLXYtWB/ywVwFbSxzVS5ND+M7WVXUQWu6cT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mC/IMG0G4P5m4IWAjOsN126J10OtzU7YHKuo0nLPBKbsijhjLyu4kVyr/9T7QABD6LC2Hzv5AwRB2PKRCF+bpCu/lsVY2FYx75ob0hr0v2HkAf1bCkTkirmtpjuDiMpzAWNo+iU3tbdwgGOc3Tymu8FpyI7dlOXre8kYnqNUC28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J206i24x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J206i24x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C99CC2BCB6;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=yhHzbQrXLXYtWB/ywVwFbSxzVS5ND+M7WVXUQWu6cT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J206i24xfOGbi5OPh0QNWbDumCcoYIm88LEfHbHGMzeiYsnSH/x9x+0B0Zecgf6dX
	 tEpzdvlb/wX+59/Z0kmhgBvHfYuvnt3fD6E+/WmZ65C4nYC5mKP3GGdL1GXyOYlRuL
	 EBRKmlijxxsJe5gmPP3zXI42uNBNl1pA/721Nfma1EvibuGwO93SkYnS1fSwlqhNY5
	 Fq+lWNHlaSDNCIoYifuPAPzuxx+6Rc7qdAy0uSZU0nsbh4kpY1ZUlbBW5UjRZ37EOO
	 LHSxmy4v0yo9H/VJ+VRKmKi8JiZbY+e2v1rRHENMQkFtjsCLPLXGgKarLqPII0TDLU
	 ikowZDSHkoDMA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8sR-1uL5;
	Fri, 17 Apr 2026 08:11:25 +0200
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
Subject: [PATCH v2 01/11] MAINTAINERS: add an entry for media maintainers profile
Date: Fri, 17 Apr 2026 08:11:11 +0200
Message-ID: <361c00348573e45b4e06b674b2b45e47dc65c938.1776405189.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776405189.git.mchehab+huawei@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
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

