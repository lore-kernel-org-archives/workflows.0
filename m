Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0030F35838B
	for <workflows@vger.kernel.org>; Tue, 17 Mar 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741802; cv=none; b=Qx3heTik/1Ino5ieV0/SrkvsGPRZDPmIGfxOFi3wDeJhL7M4GnY152HosrRiEod0O2v7nFidfmt9jhBU6LUXB7RFersySX/uZ1uxjeGubDfurM+qYotkYRUvhWG5qtoSM+o2xQknTQjLGhSD3aBI6E+tKTGhFl+OBtPQ4k9BFTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741802; c=relaxed/simple;
	bh=8fV85trx/R47h5vifBybTf4+W6z3VyyEvYi8IAwoEbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEjYwn8jugrCKfAYGu/RAMl3xEbR7kl2TBjMynTLmIbVFuR7f8lF0C14MAab1PXWPFWhPMVDWjeYJUnmslT6rX0tlGh6JZPS12gt/G/1TvvrK13Plz2jQvTLiuNukWEfluNkWJwowYkdHUbqckyd5jCDAKSB5ZAoQEsvKEIPhAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rUbADpQk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rUbADpQk"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so48797075e9.0
        for <workflows@vger.kernel.org>; Tue, 17 Mar 2026 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773741799; x=1774346599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MZ5u5gAltLh5uEgFrUNUWe9cgVa4WC5hN8ka5M2ffvk=;
        b=rUbADpQkuiiBeXzifch61iUj/UQN8yFJYfMG7eI8mujtU8DoJFPex5YmujwzyVVfP4
         31PNCh7y1ViR1VIxCVgCy7+rghs38AMrw55WfPVjwWh2ZTkmqAb/NAuT+TUiNtBb55kR
         5w7QQXIIRDWlkrEjaqAvX82ps0ewx6Ffa7iE+rwPrl+UotT6f0LehGdjcZwg7Rk7XgZU
         Lh2XGOu6Vw21D1xvzOqI+ILc1bgbyJ0dhKdkSmQ0f8tjXvYXd0dYAUUuJNaeOQgB3+XZ
         JOcOCXvd6SRn+0tU+qZdYwZg7A/VGzBsIuxYraLz3ZZIeDCnpeJVLaiG5RLoQED8zcYy
         aEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773741799; x=1774346599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZ5u5gAltLh5uEgFrUNUWe9cgVa4WC5hN8ka5M2ffvk=;
        b=OWEvIuDzr1Pa8d2QIVhFcwnAqkU66IZjzf0DgSDDPIupRfaL5GgkuXaOfxzbA9SOLP
         81EB3cvxrAM6qba4zhzQmOWVP87Inhw0lEScT927olNztUlE+R/Fj/PCt8VDKOJEA+9x
         Kyl8FziHn5ZuxmC9fUowfsOSoCXDpVaK9O5GuDgw5PLr/hUFdAQ8mNuzfiE05K7koOLg
         /aNijCzEUvMRdbOlApG5dOMhh+Frb78k+a+YVWcWJaDbYB9cosWQmcB2yiwHqqwvRDZ7
         yU4DBTcq7b+Guj/J0FTxFH+9Oj+Waj1bZwRANLEZFFWv0dKP83GH+wnZQXa4JDzW8IAU
         7mow==
X-Forwarded-Encrypted: i=1; AJvYcCW0A8vz6zK3pwhDLEEXIx3XIk3X2hP6JVBh6IaniRX1W0DvP/eulNPlW3SjBFwxD25oeTbAC6Tb9Hw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0s3TEOACViC92G5KPeLpneuv03fijX7ANfUr/mTcLmpB0Bc5c
	Jz2jkgSeqe8laJFYbJKCfCMeveUplEQdgCs+Cf247J8HziB5sHQApCpRcunP9N5sLDA=
X-Gm-Gg: ATEYQzxRtBud77u2ke7HaFNs/QWFkLtZBOo+wxTxb28ARrFjVDd4j2FojNciG6cn4Iw
	2I8BbD2ZcBInqPIV2yxdsKFfiunG6/vIotwzg+++nWyV0I6Skp+YaAPQ96jNrPYJI0b89oXk4uQ
	XFFrUZ/hDlhxI+IWaPUXwnUG61BX9jYLW92EDbtXnHn2re5MQQu5mFOh726BsSBaPmMA8gvVTDS
	+e5OqObKh30rxEp9m21XIBfNHPbiWnTyXpkkNBq88qLniqH6Th8nXr0aullumx22CjDIKy9kNvs
	Ukajyw+XfpghHoZN7sdD6/iPQTRd0hvueZwWJIRBkgm3yXERDG2IgRgQRgdJLJMQDwNI0b9qtt2
	DCxV6Dm5ykT3ALGliORCmV1zO/NpFgZY/oI5/OEn5bHNmbGV/l3rHrdcYLj+AnAN+dx08BAwiBm
	x6c475WbrNe4YDMzAZCOHlO6gXlS5t
X-Received: by 2002:a05:600c:c4ac:b0:485:33ad:3c9f with SMTP id 5b1f17b1804b1-4855670c164mr271097835e9.25.1773741799028;
        Tue, 17 Mar 2026 03:03:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaa3b66sm63481085e9.11.2026.03.17.03.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:03:18 -0700 (PDT)
Date: Tue, 17 Mar 2026 13:03:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Alessandro Carminati <acarmina@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v6 0/5] kunit: Add support for suppressing warning
 backtraces
Message-ID: <abkm46TIIBBbuuC_@stanley.mountain>
References: <20260317-kunit_add_support-v6-0-dd22aeb3fe5d@redhat.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-kunit_add_support-v6-0-dd22aeb3fe5d@redhat.com>

I think this is great to suppress some warnings, and I already ACKed
this patchset.  But we're still going to have some warnings where the
warning is the whole point of the test.

It would be great if marked these somehow:
1) At minimum we should mark them so people seeing the warning know it's
intentional.  "Intentional Stack Trace".  I've sent at least one patch
to add that printk before the stack trace but it was ignored.  We could
do this piecemeal.

2) It would be nice if the print was standardized enough so CI systems
could automatically filter it out.

regards,
dan carpenter

