Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675472744F;
	Sun,  5 Apr 2026 18:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775414210; cv=none; b=lhBDK2oSCDsthe/o97T3kVLFVlmWu856JKIDoU3aQ5LF+COB7FiJWm/pD6FAC6NhfdqVAWrR41+Itarr0vJJ13kgUi+UPKOrs9SCy/DQOVDgC3Q7dXBd19rAKr9YQUAsLgJI/1T4xmPFq1AZsbkVs9S2vsi6wp1NkhrVPWC1tPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775414210; c=relaxed/simple;
	bh=WaU+kb1NvlvM1zESE6fif2WYWMfA5XtkQfRZIg8o1bY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OJtnFPZ8kWrgCsw7RH0wIKsqSzxsTSjid9Y4HdGMEeuzn0wnayQ5BQveVoQaDhK+UQggn+hPPf0dqokcpG6SoR39XmByQbG2grgkx4UVqJ/Z7KUoS1rlgLd4YpfInV3axeiHF2+ZxP1CmZAtRiSqZP6hSg4EzQQQqvSX6eRCta8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gKq3ME5V; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gKq3ME5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Uc
	+Tv1KaPpiHbrR9LuW7jD3RLTTSHC6rSMkK3AiTwlE=; b=gKq3ME5VYTALCZXgOh
	po3z9U9Rb3wyOnpBslZR6+2pAmjsU4HFOmSVtpVMrJl+vcnLizSWA3ICM/K2GMWf
	GKksygXT9irdUbMvRDTKFOIa6EPcaNCcs7sE/zIGixuGArOC5QMQElhdGHkS5thK
	rvce+Coo4GAkQNj8ZhkfLygeg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wC3XE2Xq9JpGzpdDQ--.52794S2;
	Mon, 06 Apr 2026 02:36:22 +0800 (CST)
From: CaoRuichuang <create0818@163.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	CaoRuichuang <create0818@163.com>
Subject: [PATCH] docs: use acknowledgment in submitting-patches
Date: Mon,  6 Apr 2026 02:36:02 +0800
Message-Id: <20260405183602.73797-1-create0818@163.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3XE2Xq9JpGzpdDQ--.52794S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1kJF1xtF4kKFWrGFW3Wrg_yoW8GryUpa
	1rWF13K3WrGF1UCFyxW3WxZFyF9FW7CayDJF4qg34IvF98Xr1I9r93Kr4Y9F97W3Wruay2
	qrZIvryrCF13A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRl1vcUUUUU=
X-CM-SenderInfo: pfuht3jhqyimi6rwjhhfrp/xtbC5wYjXGnSq6YgewAA3z

Signed-off-by: CaoRuichuang <create0818@163.com>
---
 Documentation/process/submitting-patches.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index e69d19a..5c44be9 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -486,9 +486,9 @@ reviewed it as thoroughly as if a Reviewed-by: was provided.  Similarly, a key
 user may not have carried out a technical review of the patch, yet they may be
 satisfied with the general approach, the feature or the user-facing interface.
 
-Acked-by: does not necessarily indicate acknowledgement of the entire patch.
+Acked-by: does not necessarily indicate acknowledgment of the entire patch.
 For example, if a patch affects multiple subsystems and has an Acked-by: from
-one subsystem maintainer then this usually indicates acknowledgement of just
+one subsystem maintainer then this usually indicates acknowledgment of just
 the part which affects that maintainer's code.  Judgement should be used here.
 When in doubt people should refer to the original discussion in the mailing
 list archives.  A "# Suffix" may also be used in this case to clarify.
-- 
2.39.5 (Apple Git-154)

