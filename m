Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17B71F461D
	for <workflows@vger.kernel.org>; Sun, 25 Jan 2026 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769358110; cv=none; b=UVRZeU6G7UCH32R/94KQysf9U3/6Pp1464fsn8Z3MAk8silhZrr7K4Cr5ac8GW5cSZHDH4xjOSaXQ94Cuzo9fftPvYoePvdzgXImmkFkAyo59sZpnQd8wtZn/zUNvCqkigoTNkDdlvqqySyW8qM46jXjnfcNy4GapdfQLzLot+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769358110; c=relaxed/simple;
	bh=obQvDZorVnhQdKEsyrJSMxSCH0o4Jy+gXZBmk8QLb30=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=b0DMv3YxbHOIAnpX9qx+/8HjZ0Kzyekc+uvDqXvVgq4dFHnB5EfDeOGWgU7m+pzEk0rIMnLRPZ0WZAOvr9r7WqevsuUQrbHNZrUFsCI6WLh81C6z6qkX6H3qAAgU4Ax/dw7dShDAoixu1xC0ROdw20SoiLzIj8QaLEL+63RzVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4q8C4H1; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4q8C4H1"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81e8a9d521dso2183194b3a.2
        for <workflows@vger.kernel.org>; Sun, 25 Jan 2026 08:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769358108; x=1769962908; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svQOTrlqjRD0OScRO/xUlvVvTCvnFrzLdgIETK8TZSk=;
        b=G4q8C4H1webzeSgIWeG6KN762QR6h2a156ZUIWti+5HpqgG0iOWblr2ltgwJL7ASQZ
         vU93Mp54wM1msQ7o0hXq0/NbppYrXuHpZjpHfiGf25N4RnjY8ww8TGtMK+xZDCea4T+q
         35DWK19/o6JIzVgJi92aYylfK4wv+ElyD4uvlAoYXgx8ecdebqaELJm4H/7iCc2CgUiD
         HZv/lSuj/ex0D0CY19jzPNiGzAfFB9w5nbKI+vG6i35VtK6wy066Rtal03YUga4XRIzO
         w8ZCHMS5pgnHhJAAN6fMI9GbxJ8bHZfyxsfTckht02q5dHvaWLgWAiGpSxyYl6LunM9O
         uUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769358108; x=1769962908;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svQOTrlqjRD0OScRO/xUlvVvTCvnFrzLdgIETK8TZSk=;
        b=T0KU2hSYpemtydoKX5qSe+Fs5QPl87lxHIk+Hdn6KupFYRxzGWl/W+1QEohRCaX5CP
         pC0xuGL8W0WzWEGxHuWFSh0eT54pkGVWOffn7Ak1LvJ9+xEwQQemxeqnJ1asD4X1TmR5
         9euKJ+yOaewumB6ZpJMnrGhlldLkBieOhXrSkkfi6zHufA9MERXPhYfqmIY7jDMSjDyB
         49EIjOhMDTzioqbY5fcuBaBxOYXjbftA0GSHhmZ2nHzEhJsbYM0+OV9LASAa72FKyhwx
         CAHP/tqXMY6kIWmeX5nSfD42gy3OD7q8J/bkp8OcKV0zY4rNVIeAVH3N+j5HSyfQLIW6
         mgWw==
X-Gm-Message-State: AOJu0YzJ32qtnDtLjbHGwiKW51LAamWQpabj0XjT2WrlnT3NbWIA/3bR
	zxQrEdwzyvZPyNdm7aqZ3uGRQ/kOaDcc+Qfipiy5Up3fxuLmdf59F+p3VczeWQ==
X-Gm-Gg: AZuq6aKlD8WgRI9LDYsD+ylDzI4/m3BkSM+D//r8FEWBo5B8bu9T+hdeHV+LAcWzYZz
	U7ogvEDl98xYxQJu5w1sKRI0HHvf5DoDgqGfE8M0obBVku5DkTLu1pHYM+aL7q3IPelvbtRnVu1
	9unkJ2baMZbaavaqtmErujRjwS1evbbAENvasOq073Pm4XQ3HHewqFcIAG2MRc1ON6JoGW67rcK
	vKIfANT5Qn5cYODGTpacvKiU28MlBJ17ykR8ekVqGkI8YOYMeTTToQnbVK3FUHeqA/jSJM4rGPJ
	hwtCkTY/+ccvB1mSRj9Q5hHGpOpEaTXpztdBVE//aeVuD4gCXnqnN3UW9PmEsamN8oUTGoMZJHD
	C+I7lPEzyF8oLfUCd0Ya48ZYa3BqL82+NAVzfyP727mSw1tW72X0rZLHwhjT1bFrlhUzCB+3p2b
	jkGS5U94Bz5hcqcVTyBLMT4Vqsoz+3J+LU93p0vb+w2HLw0No0G3X8mo76BaJgJjifc1npwfJf6
	4vhfe/Q/Nd5lHNgXJ3iLw==
X-Received: by 2002:a05:6a21:a345:b0:38e:87b7:5f88 with SMTP id adf61e73a8af0-38e9f1458dfmr1479709637.27.1769358107744;
        Sun, 25 Jan 2026 08:21:47 -0800 (PST)
Received: from ?IPV6:2405:201:c005:c1:348e:c3fc:376b:7a6a? ([2405:201:c005:c1:348e:c3fc:376b:7a6a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a43f11csm6520227a12.35.2026.01.25.08.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 08:21:47 -0800 (PST)
Message-ID: <0bb5ad12-dd5a-4280-bf6e-7d1ddb59dd9e@gmail.com>
Date: Sun, 25 Jan 2026 21:51:43 +0530
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: workflows@vger.kernel.org
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, linux-doc@vger.kernel.org
From: John Ashrith <johnashrith6@gmail.com>
Subject: [PATCH v4] docs: clarify CC list guidance wording
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Changes since v3:
- Add proper changelog text
- Move version notes below the --- line
- Send as plain text to avoid mail client mangling

 From 1de01779d580e104bea0148409c3c8c76d204c41 Mon Sep 17 00:00:00 2001
From: John Ashrith <johnashrith6@gmail.com>
Date: Sun, 25 Jan 2026 14:48:28 +0000
Subject: [PATCH] docs: clarify CC list guidance wording

Clarify that recipients should not be removed from the CC list without a
good reason, and that replies should not be sent only to the list address.
This avoids ambiguity in the guidance.

Signed-off-by: John Ashrith <johnashrith6@gmail.com>
---
v4:
- Add changelog text to the commit message
- Ensure patch is sent as text/plain without mail client mangling
- Place version notes below the --- line

  Documentation/process/howto.rst | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/howto.rst 
b/Documentation/process/howto.rst
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

