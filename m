Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D463D524D;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243150; cv=none; b=mRp8kVE7qzHcRfGYdV++BvRfk8eTNMx+1pKDvHZyQtsKizkpwJ6M3rT3mdtOhhDdIeCweyZhTMJF8GR1C5mWloOaegZjhOVMWAba3hvSpWT9YlswTcvC+Ee7qIZd8ARCmVuqXuuFeRt6ZBaBkPhNxZobPDSXq71CCWVBAlaDFz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243150; c=relaxed/simple;
	bh=4mjLTBn9APgLWMeXtSLp7kqR2oEmNfSkkkBNyyYhQPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UikXkeu+/0NbnnIjfRWRzB1LTEBFdAcwuZ7Y7V+AYOyNe2XryJ6NNfOiCi2enj3iVfRqQ90JFaVyoiezjioe/i4hykpAFIesR58mWocfPIyxQG44AIHvVI/l3NYfI4bjVNPyfImT9aati71j+Ev67IXJ0ZR7PPHOhpysIKZXcmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+m4e0w3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+m4e0w3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BACC2BCB7;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776243149;
	bh=4mjLTBn9APgLWMeXtSLp7kqR2oEmNfSkkkBNyyYhQPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d+m4e0w32ih+Vna4JtiWUIWxmFB2cZgPA+Rifi7+99CYMK7WD9x/l+ceH5ItBh5G+
	 1yC6RoYRIoMyHU6KcDjKxbiu/fz/bjeD42vIt0BXe1dmZbXu+DEE/h726b05x6KhWt
	 l5i1uOvGfhukCGFpEvEkiH6m/F1IlRmyqo2r40YZx3sFiX4JGfu3maenO+urQgtj7r
	 9quHpxvjQ5+xE9VIgwQsmRSvdRrSLI0LjWJ69DIfO6FuXesmLeaL+AhwBrV0jus7eo
	 jL4/mMeGfKzOUHzc6ZhNsZFhfe+f7kvecCMZyZe5iNnNo/2zzbOLU6mnMVyWpMh/GO
	 t/uD5nBWV2cOA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCvz1-0000000ELwE-2yyT;
	Wed, 15 Apr 2026 10:52:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 7/8] docs: maintainers_include: preserve names for files under process/
Date: Wed, 15 Apr 2026 10:52:23 +0200
Message-ID: <61003dbb3c61b0624e6ec165428940eac3faf7f2.1776242739.git.mchehab+huawei@kernel.org>
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

