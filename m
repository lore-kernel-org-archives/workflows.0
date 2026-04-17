Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D5B36EA99;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406287; cv=none; b=VcwDfaf1EmNNumGoZb0eWcqgP4rEw+EuCtS8lKpVVu6ynq57gZX844wM/jF6bWzMKHGAY0Ekl9XGziYj0T3Tbj5w/MQQ4gD49+8/Jv62X4MOnBxDa7m2jrZZMO4Y/vKscwkXiOZ6sMCiEKXQTG2odJiU3N9MVK/i88m4QO3yiFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406287; c=relaxed/simple;
	bh=BpJ6sywaSZVQxAguZ1xiEWvvUTov0XqlViROQ62XlmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IcKNtbeiW8QXZHNzT1DBVpfppVKYLXGBVM3x3LCQARSdViMhNyI7xhEBHFjJEJi6lLZ96ONJg8CB9zyThNWmHu0njA4WM5Qzn2XGpCKXgNNQyLgz/PFPcp+8d1KOb8qnDwrcVf/87gv5vkrT9dxYXd8S9oWivLveZ0BdEbtqXus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eETLWqvc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eETLWqvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637AAC2BCB7;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=BpJ6sywaSZVQxAguZ1xiEWvvUTov0XqlViROQ62XlmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eETLWqvcFCC9Jaoj/5wsjHi9kiPxfIumXuUpdjrF9nilO9r8rGjD2BTka3Rni4Wj5
	 IlqECqNhQdIQUzL+I9bSnbKzGJkclMXG0wh3n1hdBY146/90U1a4N7mns6sSPF6AdU
	 23eBx29wRb2nxrxKzY3cD3cTfregYH7cdORdKxGPFmEZrv3F6PgRxybbW76mbCnx3N
	 x9ABfov82Bu5S5p7lWRvNPJjO9Sc8F0kexQcIjQm6a3hBXLu3FNVV6CVfE9hhgYWal
	 oJDVUHiFriz3T8AJdQvFIfnAcf3S4egZu+uIuKV0gpVsxUNhxq6BvgZqAeKPGeCaRc
	 x6T+IAvWbLXoQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8st-2ifG;
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
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 08/11] docs: maintainers_include: Only show main entry for profiles
Date: Fri, 17 Apr 2026 08:11:18 +0200
Message-ID: <47a539808bb4bf754f36b4fe8d0aa7aa209b63aa.1776405189.git.mchehab+huawei@kernel.org>
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

Instead of showing as a "Contents:" with 2 identation levels,
drop its title and show profiles as a list of entries.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/process/maintainer-handbooks.rst | 2 --
 Documentation/sphinx/maintainers_include.py    | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 531985a0fae8..3821e78aefc0 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -16,6 +16,4 @@ For maintainers, consider documenting additional requirements and
 expectations if submissions routinely overlook specific submission
 criteria. See Documentation/maintainer/maintainer-entry-profile.rst.
 
-Contents:
-
 .. maintainers-profile-toc::
diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 948746b998a3..7ab921820612 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -235,7 +235,7 @@ class MaintainersProfile(Include):
         maint = MaintainersParser(base_path, path)
 
         output  = ".. toctree::\n"
-        output += "   :maxdepth: 2\n\n"
+        output += "   :maxdepth: 1\n\n"
 
         items = sorted(maint.profiles.items(),
                        key=lambda kv: (kv[1] or "", kv[0]))
-- 
2.53.0

