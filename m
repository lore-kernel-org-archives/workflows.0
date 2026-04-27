Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837C63D47B5;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299756; cv=none; b=BGuMtZe7ThU2bBnBF8+xSnizgddlK9Z7OuGa6Pl76EaxxrBIMxdlXy93dFSQa65GeILoFGoiWmYB+2iHPZ96al9+0ANHpf1E9Y0o14gvnCRYpsfA50BlZ9uBFMf/56E5mCxFa0Eb4Hi6Ele8eqf9dkKJoomB5R2dWxe/37qjB1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299756; c=relaxed/simple;
	bh=vIA3xtTJnuuolAuvS6pYp2PgkibgyICdVHSyrMYfBXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nvfvA+0mkg9BGAsnqVRUlKsFXWF6b0oAFvelT/JMg/BhAkVGsL96wCMaWkQKAyVuBA3wLvKG4R+SRr3NHzoENFmUQNrgGGdHX1ntZ1PAqYv9TmakcLSx1ujtiB7ZeanJNECrYKu2Hh1budnIZRRN5BuB0JuIBHD36Z4zAOW2TfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyplwXDG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyplwXDG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3BDC2BCB5;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299756;
	bh=vIA3xtTJnuuolAuvS6pYp2PgkibgyICdVHSyrMYfBXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qyplwXDG3ZO3dPSj7lrcyH0Uc/XnzeaOG28ON5TnK+07AvmDZfS2Af3Oqt6jLS/On
	 sCMNUlpLg2U5Tc3wqda952zNLk2Nf/qjln7doh53LOyWRNuq/qCZk9a5EMfjBu+lJB
	 /mE7iXLP1BuZE5P4raDIYmxC1+GoieEvp0lxGrwbIe+e6+4x18b5aGzbZphrP3neEd
	 E/fYnKXVo4tHqERZAlG3eoOuopUL2EPk5vbuG69+rviBNBC9HbilPdg+q7zr7QXTYB
	 m+VOy/U/0QIzu4o3TXQdpBh9jUSocnf21cmF187cyUm8n5IKwdUF4vWPc/dFgCP8GI
	 w/i42V0eZtsJg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr4-0000000C8WB-239G;
	Mon, 27 Apr 2026 16:22:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 06/10] docs: maintainers_include: preserve names for files under process/
Date: Mon, 27 Apr 2026 16:22:24 +0200
Message-ID: <46961bc932be804cec19f06d202c23423d4aa12a.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
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

