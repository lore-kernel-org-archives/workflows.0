Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4A23E866C;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176959; cv=none; b=ad05XJ7Em4lgfjXJKvC6NrMlWAvKWdMq1jkncPzg42c4VDMEZn2V28uy4+zfLkJLYj9DDC8UZlYylGgPJ9Q4E8ovGaE8tPhSsoJDfabcmZmNd5ICX0QeKmLDUK3EcEO3ZD/ATZOzIG+r9Fv9wsnxXE5zxT70UwLSXc/UWeRM/RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176959; c=relaxed/simple;
	bh=gth3jfowrfngu7tkNsJyoJ95YLlIYI/ANJFuh2PjIdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QZOHRCIRUWYNqDraylQ+ge4aFFCW03nHzTRgvcSurhGGB4ox2OOVSv18ZoamQ9z7lWYv5AmJ7nZeaIxCXywOzCbcRsx/h8CE5DWdnsQGy2UvkHVSRfdjyTg+fzwIU+si7hC0RcQbspTzxH3srxVAnp5WgJU9lYQb6rSOj1SlXSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sa1DWQPK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sa1DWQPK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9646AC2BCB9;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776176959;
	bh=gth3jfowrfngu7tkNsJyoJ95YLlIYI/ANJFuh2PjIdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sa1DWQPKuEWeNrj1vBKpP+iAOSKkQHbfr1h/7FQryBkfBcFN/aIo3MarguP1t/S7m
	 QjpyIeRl5PMd4DoNkdC619wj20+bdmpKw+/EviFDb43gu2QYYJ0fM0dkQ7E3kIQKkg
	 OLnHF1YKSlf3AaztRb9PkeU0x9VYQZ33rLGomlH8EkfLTEVZeMgKas71NO39ZpFYXn
	 j3yKFnz6kBBjtq81MesInPO0Qz1wSQW1nUl896OsulqqFlzmUJ8/esXkgg0lpxmzWX
	 c7kbIAkKzOpM3XHXWrqbuaycnsdaAduT0GCuUXOI2E8BhMhVyu5wS40RwGFQtUQCb0
	 Mqzs5PpqTBbkQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCelR-00000007oNq-3GKA;
	Tue, 14 Apr 2026 16:29:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH RFC 2/4] MAINTAINERS: add an entry for media maintainers profile
Date: Tue, 14 Apr 2026 16:29:05 +0200
Message-ID: <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

While media has a maintainers entry profile, its entry is
missing at MAINTAINERS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
2.52.0

