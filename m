Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED4031D390
	for <workflows@vger.kernel.org>; Sun, 25 Jan 2026 14:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769351901; cv=pass; b=drqP2aaSH/5UxF3by8tBVesKhu+w/Z1LfwJQCg7ic5nhbIbmPxSguG92j0rcfZLGZnjHn83U7jS6qJscY3gLUzdT3AcaUGvjUbUTkE6ofQ8UiOcLi5IS7kfy+2rEskThZtYrgs9y+Eef5uGo/plZAp+R1o5oLgZ8yTDVxwKpc0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769351901; c=relaxed/simple;
	bh=84pZE36a3idAjaZKYB9kst9MTVawYeZWVWnGD1DYKQk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MU6hqgt8WAQVM6OiyfjdKzbhA+W3XkLKfcNf6nD1sivmS3ZlRbXAvfxiHATKhaF/hopzjWfrQfbaCKonirBD3cRJerXHMTAszNusNPNGevvhh38yhVw7nZIS14QsxsjZWNH4d4dmSSNvfVpDpof/rrcDTo9JMUCqR6MBZAcBOlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hej5gnly; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hej5gnly"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4358fb60802so2120742f8f.1
        for <workflows@vger.kernel.org>; Sun, 25 Jan 2026 06:38:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769351898; cv=none;
        d=google.com; s=arc-20240605;
        b=YPwlZW2uGBiH0wnGq+a+Fk/zsFvLVyvM2a4LWUOOYbYrEAsRvwjxTgEF5p+oHuU80Z
         YUMDryj1GF49h5A2gHiSUOBUj3bLdX9jAehEPI3Ihfb2hKocLUd5wAbDbEViB9xEGuKa
         ZKg7so0Kj5bH0wfJYDE4bpY5LKe8sK54DLi3JIDH2HsW0rBfegUrwE2QmyBz064SjFe8
         qdahbCCW5fmxJR3JgjVCnleweIPPOAi61ZBQtiBYjmB7zdwagmkwkdVlMmxt2Qd5o47J
         xPvqFzyYvA9qbiHJIU9QYosUjo4+qc0KMHWFNF0uWBZ0YEMN55DFrEZHaStMMdbEuE/j
         XH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=84pZE36a3idAjaZKYB9kst9MTVawYeZWVWnGD1DYKQk=;
        fh=myZfW5gpERuqF7wc9ek/c6O9joOHzHwWJutNmGfg+R8=;
        b=AIfU9v3oKy0l3/2PsGcb59eiXBnARJ/3A/IUZ57Autp1KQPwEoxjGGvnuEsit11pdf
         AGyNAONqoXkUwX0kceMXZYugfTFVo4RXG+dEKconUbn5SnCaeRq+iWA5VtF4hgCNGq52
         xTptgVb90D4Y85zy3gn6hRDlFfMyCAWOZ9Im040IPagu7uV75jCxVnRtu6wHYdQgH/xS
         M3YKAt5g+8169yaIU68xfZWW+V6/kuJQtc/Z/uXHe6kvVpst3Dgoi5uzW2xnw8ocBLbg
         kH3T5p9v/6K6TC/LxNsdEsTibKzzjEo5q1ofGiBtLyGRUR3uX8xo0vQrY/Cp0tLrE5/X
         GPnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769351898; x=1769956698; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=84pZE36a3idAjaZKYB9kst9MTVawYeZWVWnGD1DYKQk=;
        b=Hej5gnly2g2JwdLfXdczP3KoVuDfOcu4rXxXv+Y31R3vVM1K1HIOWfh+apZwH8Wrnf
         e+a3TuAp/7AuczyQxjIT3+dOshad2KtvbT+yHMjtJJjVCfvrqbHc7ot7IrsoK2T7jYZ/
         eJbTXprQmGYMSRntYy8yXv6gYnXTFbQshdXwhLUIQQasVExUhL4j1m+hnKDvsoawmseB
         j26O5xhD1GJGcFiUZnR4lKqsVefE4s5ILxa+6TPwOScQtCtO0mLIFVmSYO/eSaIrdh7u
         7qZeuOzijzjxHImoIqD3mPF+iCgqMO2/jB7AOYwfat6v7Xdkeaxc6yLNkxhOYau+tx/b
         QePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769351898; x=1769956698;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84pZE36a3idAjaZKYB9kst9MTVawYeZWVWnGD1DYKQk=;
        b=g2chaaYTcQvnStpUZECiqSNCTNOfXE3Tz+AmtDz73P1Gb+mxiXzuZcjhR13dIR3khQ
         JtCpK5nvWDTf8ud2IjScbIK3XIcfOTCpwHptdonsk5qxFvo26pRuPs/z/RlfnCurVrEe
         UkBeF+nIHC+peTa7EHD9Qkr0sBIGL+D0BRmLqV+tuCSvYi66c+hz0gmumDRsaeScKPhW
         qGZugV6s8Awo+RjLx+TGLE9LfgV0b8B/T68XqmLQLCJK7LNa8Z12sC0XF1LfAK8RorVF
         CoPyMPYwjmT+BPzpkzs1MOAs4J95+XMEZgPEQDEx6dGQLNThkWzVftDGu+xPlRf2+vif
         Rz+g==
X-Gm-Message-State: AOJu0YzA5Z/du+vi7N+R8IoW0QZ86vZrdzFuNBjNvr72lNOWkhtWVuz4
	IDXpMzXYJWQfgLgietr6e0VQ2G8ScFhgUyvkuPusXrTt1sgyOPuRTTvLkqiShWZR9qpDS6aJosp
	WqnlbcT7mtFo56/Co6qMFOspR+ByhL6xv524K
X-Gm-Gg: AZuq6aLm9fPSn6BFmc3F/6d0pgWo9F0VOgor8fmiiQT/1LPGhbjwDVET5pPB/GY09Pe
	FVehb5Ih4/PIqhnFkELZmIbi+LgP9wCHnRFeJDqUfLztb4KnNwUXDGfYggGamFYgO4UtYP6/2N+
	kIIB+nRAfopd6gKCZ8keYSWhzkXklIpIDo2lDV4TMKnPu8u3MBZtkohvGiUJ6lZrSnUAoYAzJab
	axhZnfw0BoelXDVGDQYY9WAjDiZ8jCd2nk4Emi/sRXD/5yA4f8YbnVw8lmcroSVgfP0VVpwl92C
	gpY2P7BBuo+ACcGRcM0P2e2z0MaXVr/uUk2GMyMoh9VbhhzeBRUoW3M+KA==
X-Received: by 2002:a05:6000:25c6:b0:432:c03e:a78e with SMTP id
 ffacd0b85a97d-435c9d22f03mr3062646f8f.27.1769351897782; Sun, 25 Jan 2026
 06:38:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: john ashrith6 <johnashrith6@gmail.com>
Date: Sun, 25 Jan 2026 20:08:08 +0530
X-Gm-Features: AZwV_QjkSg0nU-p-brwBuLkSacTlQxfgU2P83XhNs1JvcxdL-cfC0aG9rCiNAwk
Message-ID: <CABoKZACHObTMAC5FMvhRG3Guev_s_Pys_t3G7LAqF7BTiLD+KQ@mail.gmail.com>
Subject: [PATCH] docs: clarify CC list guidance wording
To: workflows@vger.kernel.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch clarifies wording in the CC list guidance to avoid ambiguity.

No functional changes intended.

From 416237c2cea7ccb4fa863ebc260777ea102b2b62 Mon Sep 17 00:00:00 2001
From: JAR2004re <johnashrith6@gmail.com>
Date: Sun, 25 Jan 2026 14:17:13 +0000
Subject: [PATCH] docs: clarify CC list guidance wording

Signed-off-by: JAR2004re <johnashrith6@gmail.com>
---
 Documentation/process/howto.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6..5a29111d6 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -403,7 +403,7 @@ interacting with the list (or any list):

 If multiple people respond to your mail, the CC: list of recipients may
 get pretty large. Don't remove anybody from the CC: list without a good
-reason, or don't reply only to the list address. Get used to receiving the
+reason, and don't reply only to the list address. Get used to receiving the
 mail twice, one from the sender and the one from the list, and don't try
 to tune that by adding fancy mail-headers, people will not like it.

--
2.43.0
