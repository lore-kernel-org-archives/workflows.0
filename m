Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE04C304BB3
	for <workflows@vger.kernel.org>; Mon, 26 Jan 2026 04:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769401366; cv=none; b=DMN2z58jMSfRWKelxgRWo9OFdkIv7y7NoJN/rzKGOWcjB+8XPyabv6KFw9TTGpV0HPUaBpR325BkfuhqGpsfWPwc+Fugbc6kb33sgsY5zsOHFx9opfIkyRMw2faTJHbjGsdLMwgwZdvd1pSS5zhR+mBYHS4/+wN7TiwTSVQeUAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769401366; c=relaxed/simple;
	bh=e4QsZET6UZ+1H0vD+BcRDTxGDlM0hhs4k8to6PScDKU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Ta8Hgjsdtip+e/ElbWIBKLXULAEk65HuwlOkJr7ecaOjCa2MYjiwEk/1mElAjKcMkvnKQ5l7gyZ77yuqVPvDotoaUdnJWJF/P+BRn4jIU3fJYF8ZUffgJa4/j6XBFVTmN5uivP4JXzHFt2QWHaCugTzw1/wTDh4nY0lUWB2zXcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxFGad10; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxFGad10"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8230d228372so1698290b3a.1
        for <workflows@vger.kernel.org>; Sun, 25 Jan 2026 20:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769401364; x=1770006164; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+XJK0+ARuYa5Ty9ZZI1bj6RQjF63ZwhVPzjpjM2zqE=;
        b=IxFGad101gbEB+Wf7c7drR+/yTScDX2F2o60ZEq/Ib6KaDxU9Tw9lq/Nz5/F81h56l
         848zWn8Ns+3fea2CB9z3t9ioquxzckEeZQJbil7i4mZXwhPA76e6p+TZu6JSPE58XVEq
         t2v155oWnGZ2wPH7DsuKJc6sajUGudj8AahyvEtCMJ+Jv0/o7OwTjWlTblbXsR60bOy8
         30Wn/B9/ekVm66GosJ8ZPkDtdWrsqVFe1DztiMDe0IWTiS2s222onJkHy895qbaafguB
         NyTjnKrY1lljRODuJxAMFsAUNoyG7EU/YWHrvVlJQnoyqC4E3GDODTtp2FcHhYhVfgzm
         sBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769401364; x=1770006164;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+XJK0+ARuYa5Ty9ZZI1bj6RQjF63ZwhVPzjpjM2zqE=;
        b=ENxQHv/k9V82Lr6F3VeIkmS0cg+vWmlzoXCg0heD+gKgPBJq5LyVgkwlhPZ8nl+EPq
         JozpskpazmwfW7QTQFdmrlR+3YxaKHXvTl6nMgSEE2mIKgUyQZBicODsrwOTcvE9SRJY
         x96B8EnoRPdgLzvlFd3hkwizjb1WvCUVdDiu7d1DZxGvaJD5JHXZ8g8Hlu0PoSdjfek3
         /6c5/f8LUSY2XUFgmspt/AW+TDOLQyKgro0NScpvFydU9T0+rXP2QT3LZywjxYD82r9v
         vUHx0XPEVLJXeZK1gijYlJLCxYYi9X5DANQP4c3dgTEjZPjYIZCfa4yM/nQX2vlFWhOw
         6hZA==
X-Gm-Message-State: AOJu0YwpJvbFFfxVu9Gwe0p6mUrT1n5T1FGq6ap5YPD5a5CcQNTkMY7v
	ay+SeuYnL4zaqau5ieafmUL3cYwtAum+CUtiIYP2rljYxHUp/FxyF8A0MRwlg+Cv
X-Gm-Gg: AZuq6aLb+SWxjpGcbGU0clZxiQUjTAL0c3QsBOYe2A/vyppTv0Vb5hjglXCCsruIORj
	zhhxfgqgYrBJFmCmi9TcxTus3YfKGWJ5qPZZ6ReE/Qfrg+u+dcI6TaJjDQouBem2GftBElf6qoa
	wclOmzPHEdOsfu4ARvemSlm2oJOIV/YgdmrScangBVaDmgFW/XqYaYLf0SitFIPJJR6TB+lJvKZ
	1ADB52OEACB6w8i2etncC3TVaflijE3oIq0+2WB9HQ0bhW6fFYw3M533DcRpVC/GLdy8W40z60R
	041SQ65m/mXxuzX2S5pWKk+1NaSr2vKQEo585kvQv8Ar3eRumzGmU2How/Yj6QgHy0wClNNUV3T
	KTndSeTFDbt7bJ0dPc+rIcHAZU5wQSAjyVLdniuPI6zwirBrdRw+GqaOtxLW9HZ53vqoze3GJ9Z
	G683FbNMPJQpASttdtGGYnC8MpQgoB7wtMZ4nZISbmY2l36XOat/uEDSPRPF9kIkDLNKmMUhj+0
	EdcIh3BFR3BAPSlV8IoJA==
X-Received: by 2002:a05:6a00:ab87:b0:81f:4164:79b0 with SMTP id d2e1a72fcca58-82341259667mr2641917b3a.31.1769401363753;
        Sun, 25 Jan 2026 20:22:43 -0800 (PST)
Received: from ?IPV6:2405:201:c005:c1:4125:1b86:6db5:52c1? ([2405:201:c005:c1:4125:1b86:6db5:52c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e903sm8111036b3a.51.2026.01.25.20.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 20:22:43 -0800 (PST)
Message-ID: <58223eae-e0e8-4d3e-be1a-7f48b337299d@gmail.com>
Date: Mon, 26 Jan 2026 09:52:39 +0530
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: workflows@vger.kernel.org
Cc: jonathan@lwn.net, gregkh@linuxfoundation.org, linux-doc@vger.kernel.org
From: John Ashrith <johnashrith6@gmail.com>
Subject: [PATCH v4] docs: clarify CC list guidance wording
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

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

