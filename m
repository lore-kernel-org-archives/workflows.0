Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CAA3BED37;
	Mon, 27 Apr 2026 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294818; cv=none; b=f1LRqkpLBclqRaTs4R0vv6oPz2GYEZvAvWU7UiydZ5OFbDBtkFiuZQZh3yahPAoD8+qDipOuaaOu0OaLOrOOtP2g8+vvKvOluMJ+cK18Sb2QfH8c4WDMaIX3scZP26FpOqw3g+Rj7RcylnZV2lEUGiNxl/Fu8qN8U3DATG5iDq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294818; c=relaxed/simple;
	bh=4mjLTBn9APgLWMeXtSLp7kqR2oEmNfSkkkBNyyYhQPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fl7XBT+loA7RTzghVBpTxgTSV6fr2Xs4fDzSiNG8yKm6U8D9ABwK/3HRGKoKcm68I4+aOBirDDUz/SBeU+SZGcNuhccCnl5WZS75LPca5loBvJwLwkXp/HyhYNlOzUku5H6qSyhVJf9lGVcDQ9gMFZtATm6xRyzeRYUHANvJNmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdWO0xm3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdWO0xm3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F15AC2BCC9;
	Mon, 27 Apr 2026 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294818;
	bh=4mjLTBn9APgLWMeXtSLp7kqR2oEmNfSkkkBNyyYhQPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mdWO0xm3B3QkY5C0zz71ViWphwLS6IdHv/vswRFL3bvIczBaTYTj6RuXoTBsThL7Z
	 W1/cxV8uZLfWfgtnIlwa1C5fNTZSHciiQCkoCgu1n8c8fKPbq6F7A7mF1eWCalRSme
	 havptakztxfPnnMXQWGxjKO/UFDadHPPAuFbvtS9naJPY9XnCm4rjwmwUIv7VMhWPx
	 snM8MRw0tgH65iCjUyLnSzHwCRleSIfF5ss52EzqYJ02RbIYXTjx/jJBfq9o2474DG
	 1Io5wHxwLcn/FlZGaiarL5mo1TpZb5oU8d5moPaM5XEnUSQ1D9Q18MUC5LXUaicvXa
	 KJnsz0hXRn14A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZQ-0000000BxAt-3Tau;
	Mon, 27 Apr 2026 15:00:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 08/12] docs: maintainers_include: preserve names for files under process/
Date: Mon, 27 Apr 2026 15:00:08 +0200
Message-ID: <44165bb12641055e4ecadb2ba95fde36fb46ff86.1777294623.git.mchehab+huawei@kernel.org>
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

When a maintainer's profile is stored outside process, they're
already included on some other book and the name of the filesystem
may not be there. That's why the logic picks the name from the
subsystem's name.

However, files directly placed together with maintainers-handbooks.rst
(e.g. under Documentation/process/) is a different history: those
aren't placed anywhere, so we can keep using their own names,
letting Sphinx do his thing.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index f1b8d4b00c2a..948746b998a3 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -76,11 +76,13 @@ class MaintainersParser:
             match = re.match(r"P:\s*(Documentation/\S+)\.rst", line)
             if match:
                 fname = os.path.relpath(match.group(1), base_path)
-                if fname not in self.profiles:
+                if fname.startswith("../"):
                     if self.profiles.get(fname) is None:
                         self.profiles[fname] = subsystem_name
                     else:
                         self.profiles[fname] += f", {subsystem_name}"
+                else:
+                    self.profiles[fname] = None
 
             match = re.match(r"P:\s*(https?://.*)", line)
             if match:
-- 
2.53.0

