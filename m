Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AFB2ECEAC;
	Mon, 16 Feb 2026 06:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771222062; cv=none; b=DEpoSDXysKD1zxH9YdC184ata+MPE0jETUGONoYH8+w18+p6l8ZjZ3QSiLijXnTIvA8qLvpiURWzSYC35TlJs3ajTLLDHBVdu2acneQY0tcsoBaLMU9SUQatjC/YlkhcDG4WCQjVcdxZinwUCyTZZVJKSghc6D7tqCc1UsSzTMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771222062; c=relaxed/simple;
	bh=fVhqriy7oD2fxsLnildZNf0upge6DB1yH7yA+AQc7fU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NA9m0MbXEuEBe2tQQnRmJ4zO0vW1wLV6eaEb7TTsNvDZk4zz7dp+OXQwiQULef3zRxCBfYoVfmXimtrbvc78n03b9LQCVdi3+CnkIoGjV9618IccirhYk8YoHWqffSy0f48AqtBeW2yjUia5ZYRzFxqc5N6yd0yIP2VHZ2sHwtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IRU1xdvB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IRU1xdvB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=VacMt1CMOibezwUMmM/iNXVEh3MyDR4UboRRmFE4KHs=; b=IRU1xdvBrpNblyZoEtr+CZKvSF
	x9mxMESz0oGgDKiUq6Q8kJE/4dsCvliuT8WvZudBz/F1Qw7IwoYD36znkl3s0kDMP2vpWc+nr/GBC
	fOeCZehOFYH33rqDfXlYzD9hJYMSMppCodzZ/cmx2+JO8Q+44jb31VjHLmDxnQuTpjD/QqKyQC08J
	bvuxoirIsWd/6+nGlLeZZq9qF5aFzDPhDMcF30LYei5yKQahcO6h0WLb/xrWnvX5yZQgo1qIz09xW
	I504UeFDdZhzwC4IHmLhfW09VI9Jnmf45+chEslF8lyDMm0LghEEGW7iBLlOL3tpisLYHqAz/Yhox
	Si48A9DQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrrlk-000000060cd-07X9;
	Mon, 16 Feb 2026 06:07:40 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] linux-next: update maintainer info.
Date: Sun, 15 Feb 2026 22:07:39 -0800
Message-ID: <20260216060739.2791462-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the MAINTAINERS file and Documentation/process/2.Process.rst
with the current linux-next maintainer information.

Translations of 2.Process.rst should also be updated.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org
Cc: linux-doc@vger.kernel.org

 Documentation/process/2.Process.rst |    2 +-
 MAINTAINERS                         |    1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

--- linux-next-20260213.orig/Documentation/process/2.Process.rst
+++ linux-next-20260213/Documentation/process/2.Process.rst
@@ -291,7 +291,7 @@ Use of the MMOTM tree is likely to be a
 there is a definite chance that it will not even compile.
 
 The primary tree for next-cycle patch merging is linux-next, maintained by
-Stephen Rothwell.  The linux-next tree is, by design, a snapshot of what
+Mark Brown.  The linux-next tree is, by design, a snapshot of what
 the mainline is expected to look like after the next merge window closes.
 Linux-next trees are announced on the linux-kernel and linux-next mailing
 lists when they are assembled; they can be downloaded from:
--- linux-next-20260213.orig/MAINTAINERS
+++ linux-next-20260213/MAINTAINERS
@@ -14749,7 +14749,6 @@ F:	Documentation/memory-barriers.txt
 F:	tools/memory-model/
 
 LINUX-NEXT TREE
-M:	Stephen Rothwell <sfr@canb.auug.org.au>
 M:	Mark Brown <broonie@kernel.org>
 L:	linux-next@vger.kernel.org
 S:	Supported
