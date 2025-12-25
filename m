Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324AB3A1E6D;
	Thu, 25 Dec 2025 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766665952; cv=none; b=gFCFKkZ2w0w0roDphcrb2RkiTlSgglUs+21bMj+u6dlR1chMH4oYgI91WWw32rqoBSwZ/6nQ9BNR5pCqBvn1hgj+VBfE4cUOGRIO17z06tnIz+6/AV8Yn+0CqNi5onal3Opu24fn9CXu1UjuvxOJ7vhRvzvRMXyO/YoNEutuV4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766665952; c=relaxed/simple;
	bh=v9bryisTSBRr+BXg4C4EsjyO9/G1RYyLeXWoRywa+wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fJkHyK46L7i6c9upqASlfcu34gxSbtmXX4XnCRe194P83AuNElQp6SLWpSD7814RhcPBSuweCSef0ovNbkX6ylLuR3onoadNEOLEtCryU4xMgFXSdV3AHOIa9fhINozDTWQHX65EdDBU8L9c5hQGGlLzxIhlpeUn3+SHVL/Pq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCqn3XLj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCqn3XLj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E84BC116B1;
	Thu, 25 Dec 2025 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766665951;
	bh=v9bryisTSBRr+BXg4C4EsjyO9/G1RYyLeXWoRywa+wg=;
	h=From:Date:Subject:To:Cc:From;
	b=nCqn3XLj3djU3D7hODSjOe4YK5BwLyIMuOnl23UDDS/X0JoqrgyWJXHOHiQ50rmZf
	 qmdGvf+Mp/cN6HFjDxSsZgij13rPjPwHVOXX8f3nRLA0xRQ/g7oFmmoobLwU0uWNQX
	 WEkXRyKgeP+xWpcuYclz9dHTsnCngygB3BixAO3E11yAymUi0njGut0qDMEyTr5jbq
	 ecXqaKgT6wOygOxbLjBOGauHfZxJCIisjHQ6RHoYai+xI1I2NJywFm4SooOLkSkn8/
	 msgXJqjlBWLpaTxL6TL40iV4l+ITK8jjXSYLmXXzScUnVHQfXOWT8TvsHaRf5ilRa0
	 CNyJ0PR6W17Qg==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Thu, 25 Dec 2025 13:32:18 +0100
Subject: [PATCH] docs: process: email-client: add Thunderbird "Toggle Line
 Wrap" extension
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251225-docs_thunderbird-toggle-line-wrap-v1-1-24794afa4abf@kernel.org>
X-B4-Tracking: v=1; b=H4sIANEuTWkC/x3N0QqDMAxA0V+RPC+gHR1svyIymiarAWkl1W0g/
 vvKHs/LvQdUMZUKj+4Ak7dWLblhuHQQ55CToHIzuN75wTmPXGJ9bvOeWYzUGLeS0iK4aBb8WFi
 RSa53inTzPUHrrCYv/f4f43SeP8fX7ZpzAAAA
X-Change-ID: 20251225-docs_thunderbird-toggle-line-wrap-dbe39bcb650b
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rob Landley <rlandley@parallels.com>, 
 Sotir Danailov <sndanailov@gmail.com>, 
 =?utf-8?q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, 
 Paul McQuade <paulmcquad@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=v9bryisTSBRr+BXg4C4EsjyO9/G1RYyLeXWoRywa+wg=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJm+ejc19T6y1PbNnb5cO9JgWc21fof3wl0bzr459Stew
 /xS9jHNjoksDGJcDJZiiizLyjm5FToKvcMO/bWEmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWATAYuTgGY6v3SjAxzbu9/Ghw71V+lqWju7O95FdMVn9bf38CiMv/I27htbx9cYfin89dFw4H
 jIOvE/TzhnSH5zLG3XzjO1tk5c9rvLzl7LuhxAAA=
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
to create a war on what is the best option so make it clear that this is an
alternative.

[1] man git-format-patch -- §Thunderbird
Link: https://git-scm.com/docs/git-format-patch#_thunderbird

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
and Merry Christmas!
---
 Documentation/process/email-clients.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/email-clients.rst b/Documentation/process/email-clients.rst
index 84a2450bb6ec..27cd43b185dd 100644
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
+    https://addons.thunderbird.net/fr/thunderbird/addon/toggle-line-wrap/
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

