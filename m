Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EA93803EB
	for <workflows@vger.kernel.org>; Mon, 30 Mar 2026 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863608; cv=none; b=H8AM5qDTpN0sDxb0l/K+zooGgxajfj7T5+3qc0Xa7EWQHwN++RsHbx4BBwkobSPHzw+ycxZmz2uaug55/fP6/GPQnDulsF64FKh/IPys11xylt+d2RFOIOdfA4QpLf0kXhWJn3NfFrytmmBD0ZcHq/ciyGGyCRNUyXHYdScWFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863608; c=relaxed/simple;
	bh=qql13zPiiqEd2+a2raSu6JfK6cJR0XNhUjqEei7E4jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tTR6B5zGDuOJcEfX+jYDvFq1fWc+nQImVZzYKb4ebJjWyaF99oqXDNPH5RfTbJaN8MqDks6y4PGN9RO5cQUxRzEWQEP+c2iPpavqaNCWFrekrWl9rKp3vsmskdeSAnGRm+12r3t4cwJOmPk9EliVGeQELcAWnJBbpFAAYQOUGXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CMg5soou; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CMg5soou"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fd5c4891so4763005e9.2
        for <workflows@vger.kernel.org>; Mon, 30 Mar 2026 02:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774863605; x=1775468405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Pz5WjDNwODkGCTD7FY1PbGzbLHarF5Y8FutE1r5Is4=;
        b=CMg5sooukPmqQOLoelhyhwkpI/0NhlOgimSIaOHXBzJJJ3xgdNjWOw76pCzuKh4Oh6
         zRGM9q1oYd8o8DA7gOqzHRCgx/iXrKvMWMncxy/anLD6DJXdWyHGjGbtaqsXRZoflFG+
         HtwyhTMXTYNQpq5IyepV9aQ+5/K+456kSrNJIP3GsypDY+86A6QII6MYI6v1NCjWsC//
         ftcoEi+KZXZwbAgQML0w6EzF8mN2xchI2iwG7hR29Yh3dQuShAutF3IOJQWGMp2hh1r0
         02UyEvAoinPITYFisl8zH0tfg342F52Dm9ezgHrShIBeflSOcSbs9BdLCSCE/EkXt9d/
         TV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863605; x=1775468405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Pz5WjDNwODkGCTD7FY1PbGzbLHarF5Y8FutE1r5Is4=;
        b=RAo8Uim/jT0MHEsusGIf/mWqQBPpeJ7Vcm8LPrJBXft2drfiFYgmYDPuHPYZjl2H/P
         nzdwuvw0OAPbM19JjXuqxgQzA0FTw9aewbGqtJ74yuJs1pVw4lgdYT782gM4L+EjNNtC
         AOxmZeEzL1fUmuw6ziGT4pk83ZXqM6VlHgOdrcS9DlUAGhuMqboBTxPiybZPhKNY7VBy
         XjMMXO1fFTT0K7/oTCgX/q8XUF/BtXHBmPijBM8mVWSmwmnqr2/CfevbnXecwZ7E4y2p
         aeNUHRlcy7fRsCDSrDEu3aP747Lm6HQVzYmMOMq7W+0yNI4ewGP25okqWhKvhhiYFD45
         Iumw==
X-Forwarded-Encrypted: i=1; AJvYcCXy40rM9xOvUOkBtSuZ8JUZrVsMorVBk3Zflbfe5DKCMLCq5J5+QpkEecNKZesUWpPFMq5Sb0Btm0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHPIwENrMHdXNlOfqXK1q+IlLHcUvDiUXkZ0s4PiKb95gyGknZ
	iw1nDkKFoY41k3BiU9Awuj7RnMZuDFSiMRP/YMERI4vNBzU+EV5ife6UovqBpALV4S8=
X-Gm-Gg: ATEYQzzqmdP8dSpVrEgHHmXWbnVcKi6P2b4Xw9DiOqCV0/KkURlk9feS87G+YskgEIB
	En1745iK4dsOa7fzl98T6UAcFSGgQKRclZ4b2ONjkioAdKM317CsoAvY7Qc4Z6l7mDAPiXmalDn
	R6q/6+AgsLW7/qCKmlrhNKJ7xDPRZOWGUtRno90iTPvlB/tJgz/5OtG5Sw7Rw/qX2mNKN8iw+54
	qZ5AnSJOxvI5MPC9uOHNz2o377kgsSJb2/m1mLF05LGv6jO9Kuqrz1oB0OD5LIESP6t06B8A6Xx
	SdpVVt6iHtyFk1/5iU58VWZ78MMvaAMVdvApFvMwWeMrjZNUWvdbJG1w2tBcrnYbjV4NMNBkfjD
	ww6QatNwSRqF6aptGYIZUxBCvJU7c+1JIzRMTjnOHZw+xuiumfbG4wHdrNNx8dbKFBOOcQEc5kS
	QLMbVY/n0mkSMPAXq3l0g64dsPP8IOglVOb9Syn8QBGzqvorInn9cx2hZaFIJM0iRr8iHI
X-Received: by 2002:a05:600c:3511:b0:487:575:5e3 with SMTP id 5b1f17b1804b1-48727f5a798mr109936905e9.5.1774863605305;
        Mon, 30 Mar 2026 02:40:05 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270f1943sm96676395e9.7.2026.03.30.02.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:40:04 -0700 (PDT)
Message-ID: <942f53b9-d8a9-4730-a88f-464f54d5c868@suse.com>
Date: Mon, 30 Mar 2026 11:40:03 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
Content-Language: en-US
To: Joe Perches <joe@perches.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <acTPXMJfkHLeItrK@google.com>
 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
 <acVIBseRrqJI8Uwb@google.com>
 <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
 <acWnbG3nGjfYeYXh@google.com>
 <34318752a257b0f6b530eacf53d565de1ac84485.camel@perches.com>
 <acW6Iar6XOzO9IfN@google.com>
 <f4dcaecb682c4eaa271abfee27c7cc8f6fbf7d1d.camel@perches.com>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <f4dcaecb682c4eaa271abfee27c7cc8f6fbf7d1d.camel@perches.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/27/26 00:19, Joe Perches wrote:
> On Thu, 2026-03-26 at 16:04 -0700, Dmitry Torokhov wrote:
>> In all seriousness, if you will not make use of this mode it's fine. But
>> it allows keeping the source cleaner as one makes edits, so why not
>> enable this?
> 
> Unnecessary complication.

Are you maintaining a tool that you want to be useful to others, or to only
do stricly what you personally think is necessary?

I don't understand your objections to this rather straightforward patch, it
doesn't look like a maintenance burden to me?
