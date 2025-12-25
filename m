Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBAD284689;
	Thu, 25 Dec 2025 23:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766706446; cv=none; b=cVV2q1EnCcwXCpOpGfsVWJOk+f/LHH8ONh998WzYKR5enW9lTLmCg6TPjAYbcStVTB/bLLZ8rN0PvmYHtyKaH9GXzzy/4RbyCxUokaQnD9t4jWF/WFP1qzYdX/01Uvydhn4GEb8C/3j8qdKIjgha3WxyodBExOf8xgv88zz8bwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766706446; c=relaxed/simple;
	bh=Twi2Rw3E+MF8pejTy8vVgYf9zIrrWtmMpWHzy6Op5kI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LryaO0zTuQ32V6T0lJhGZDpOriGO3/ZX+pAZz7/zzsCpkSqWtrFWp9rC8OfM8TmYLIFa6+H377NmSpFl1NBokcxtCCeP96xdj8Q9fMublvgo6NFbyMqduvA0xg8mQjI2uRBoS3yiSwIiGIQOUY16OPdofTQg7Lv9ambuadBF7VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+1yTHUV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+1yTHUV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C568EC4CEF1;
	Thu, 25 Dec 2025 23:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766706446;
	bh=Twi2Rw3E+MF8pejTy8vVgYf9zIrrWtmMpWHzy6Op5kI=;
	h=From:Date:Subject:To:Cc:From;
	b=h+1yTHUV32imXJNYMjxCLWOOr/nTqiC4q4mQKcSrkY4XFreOcry1LMpGz70H2vwcM
	 wkzvZfq86DXsetkA22q8wq4CU61tzb/uNvG4aZ7JzZFTzZOs3qWX1JhGWj8+MCkM1K
	 65LJtjYCvM1PRM8OaSybUniNmBhDm7BAiSlpN2Bm/CCier4jcQABzt8il9OVH6BH8l
	 hNpP5cGo6J/ZSbGuzCpDsJmEkLwxZCxC0aPBMTBd7aShK2xDFkdZk9Iqb4/oNypn1H
	 I24Gm3re6NF+5t41aJer1Qs50mKIHOIVDTX8lTRAhaLE3L5CeaiTgj/QqmLCu1cDV9
	 83w3UCOIwmWxg==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Fri, 26 Dec 2025 00:46:48 +0100
Subject: [PATCH v2] docs: process: email-client: add Thunderbird "Toggle
 Line Wrap" extension
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251226-docs_thunderbird-toggle-line-wrap-v2-1-aebb8c60025d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOfMTWkC/5WNQQ6CMBAAv2L27BpaQYMn/2GIaelSNpKWbBE1h
 L9b+YHHmcPMAomEKcFlt4DQzIljyKD3O2h7Ezwhu8ygC10prSt0sU33qX8GR2JZHE7R+4Fw4ED
 4EjOis3SsbWtPVWEhd0ahjt/b49Zk7jlNUT7bclY/+099VqhQl+e6NJ0pje2uD5JAwyGKh2Zd1
 y8KUR/I0wAAAA==
X-Change-ID: 20251225-docs_thunderbird-toggle-line-wrap-dbe39bcb650b
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sotir Danailov <sndanailov@gmail.com>, 
 =?utf-8?q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, 
 Paul McQuade <paulmcquad@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
 Randy Dunlap <rdunlap@infradead.org>, Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2226; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=Twi2Rw3E+MF8pejTy8vVgYf9zIrrWtmMpWHzy6Op5kI=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJm+Z9nXHjCSPF91ep3y2ZveZ27s5Xr86qtN/Mf/yy9cf
 3LypGDylo6JLAxiXAyWYoosy8o5uRU6Cr3DDv21hJnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DA11gEwGLk4BmOrpDxj+iswzPznbcN28KYJq1affCm1ayPrO+sjRd99YGFgKVkxz+cDw32v2qsI
 Lt/iVBE4oh/YoqrZ0CMwXF9UTmLxFxqd9Qv5rTgA=
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

While reading the git-format-patch manpages [1], I discovered the existence
of the "Toggle Line Wrap" extension for Thunderbird which I found rather
convenient.

Looking at the history, the ancestor of this extension was added to the
documentation in commit e0e34e977a7c ("Documentation/email-clients.txt:
update Thunderbird docs with wordwrap plugin") but then removed in commit
f9a0974d3f70 ("Documentation: update thunderbird email client settings").

Extend the paragraph on Thunderbird's mailnews.wraplength register to
mention the existence of the "Toggle Line Wrap" extension. The goal is not
to create a war on what is the best option so make it clear that this is
just an alternative.

[1] man git-format-patch -- §Thunderbird
Link: https://git-scm.com/docs/git-format-patch#_thunderbird

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Changes in v2:

  - Use the international URL (remove "fr/")

Link to v1: https://lore.kernel.org/r/20251225-docs_thunderbird-toggle-line-wrap-v1-1-24794afa4abf@kernel.org
---
 Documentation/process/email-clients.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/email-clients.rst b/Documentation/process/email-clients.rst
index 84a2450bb6ec..b5377630a648 100644
--- a/Documentation/process/email-clients.rst
+++ b/Documentation/process/email-clients.rst
@@ -324,7 +324,14 @@ To beat some sense out of the internal editor, do this:
 
   - Set ``mailnews.send_plaintext_flowed`` to ``false``
 
-  - Set ``mailnews.wraplength`` from ``72`` to ``0``
+  - Set ``mailnews.wraplength`` from ``72`` to ``0`` **or** install the
+    "Toggle Line Wrap" extension
+
+    https://github.com/jan-kiszka/togglelinewrap
+
+    https://addons.thunderbird.net/thunderbird/addon/toggle-line-wrap
+
+    to control this registry on the fly.
 
 - Don't write HTML messages! Go to the main window
   :menuselection:`Main Menu-->Account Settings-->youracc@server.something-->Composition & Addressing`!

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251225-docs_thunderbird-toggle-line-wrap-dbe39bcb650b

Best regards,
-- 
Vincent Mailhol <mailhol@kernel.org>

