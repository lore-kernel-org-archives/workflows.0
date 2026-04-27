Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE51E3BE65F;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294818; cv=none; b=Wi5GfT7E3pi9X1lVA/zrAYKHRHKdZ7BZ1T0MwSwa6cr9pWjNKne5oVNC4yA3pDHLxg2oAR3lWwSlhvuFzQm1yqHEti4d/ruoqoU4ufgRHVmpWx5Y4oxcRmKx+XLCilMI+Ed6jmDOTAOMnCpfrjjPZajbTmMKoDxiBD4BLZAvvKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294818; c=relaxed/simple;
	bh=oCSFDjePyMaj2tf0ATqd8TtAxNzPuU0qXsi2GNKPtg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y0L3+rgAm09q+A0y8QJ3yw0e2/7rlSePlY2Qws8xiJMUU+Een+LbFbrts5VN+bF2E8guJvv5wCP0PYuyk/SN4EJ663verL6baxvHw5G1JTHvKJOubgcsh0Gt6/4WdASS1bg6p6blj7Jz6AjegI88xW9CT8toJpp/WNUdojYZLCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oySn7+FC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oySn7+FC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8F2C2BCC9;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294817;
	bh=oCSFDjePyMaj2tf0ATqd8TtAxNzPuU0qXsi2GNKPtg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oySn7+FCcN5qOKEJWRR/IPvZYWjwWsoyKy2nv2kxiOkA3EnXYlHHRkq5y7Z0u/TQq
	 m3CsLFU7hADLzfgawL3/XRmaOW4PYgEkrt19482CxOdZAE7k2pIvoH+uTAQWqK2n+M
	 JzWNf69uhLBLtGm2kVYAxnjXwbxgLdFPVi8lX/M+CStkkBsSC7W87MRljkmArkiYYj
	 kBijZJHWh8LeNk297oa/Ox8RztwuVIf9uW7snv1W5bqb27KT19xXiJBAH5mss8JD5+
	 E++9oZwxXOczfMeb+CQayKNNTcUIobw1wZdEiJDylNOtn3N+LJKZM8i96GXk4lMAWK
	 OlaT09682coKQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZP-0000000Bx4q-45Ck;
	Mon, 27 Apr 2026 15:00:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 03/12] docs: maintainers: add SPDX license to the file
Date: Mon, 27 Apr 2026 15:00:03 +0200
Message-ID: <527f6ebe5c0831e92b26a63d3f9b06ed735bb62a.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

While this file is really trivial, add a SPDX license line on it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/process/maintainers.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/process/maintainers.rst b/Documentation/process/maintainers.rst
index 6174cfb4138f..5d1b1464c3ae 100644
--- a/Documentation/process/maintainers.rst
+++ b/Documentation/process/maintainers.rst
@@ -1 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. maintainers-include::
-- 
2.53.0

