Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B0E376483
	for <workflows@vger.kernel.org>; Mon, 11 May 2026 13:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506070; cv=none; b=ZaCe5Q+8BWgHJiCqPljCSs0abS7e1bj2tAWLqckvBVqsUOjp6Zt1lngd30pD/CSAoESVj0rqGqJf6hF0OBWacXcByP8UZQBE0WpznbIw0pCCKc8nz5n7RlVPOy+FOTgJugN6LohQS981+OUQk5jA/yQ/HfCtyZYaUFlRIFTb27A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506070; c=relaxed/simple;
	bh=lJECCfxqTC84+TRfNfK1WjSKb5OBfQHZ4y7RrlS2S04=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXiP5V/MjfZuUs/IOKb5WC9cAr4fERL6vNb3qj9ZwOH9MSFpBtnUWelLpTMnffyN8FcCErYfEfWM1cnW8w4x84DlzSZgD8OlycgEOpHXnQ7wiUajCWw/WfOFp0FUwfoj1sqs6OUi8En2XLF1rrZ6AljQ7ykbaBoVYp+cklcgxpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MflJn9us; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MflJn9us"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so26768525e9.3
        for <workflows@vger.kernel.org>; Mon, 11 May 2026 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778506067; x=1779110867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIqj3PJ8IFkl3jV3tX7I8ABRXAJUOvr2KgrwJ/yHDUM=;
        b=MflJn9us+kizAim1TVv7ZqnuDf4OEjp13+NZvSHomJTLL/hYWZLJKn9khobOSLPKxZ
         ya/uy2fWwtue4LDEk9jtQCIsvpl713Z5A3zdE0jBmUSjD2JxMf6E4UubKj87ApWL8p0C
         qjNIgdzZ2TISGb/cIehD3afKcf5cGbhP+efi5SRImgwPovGbjUCnkTImBFKjUVzOTmEm
         8Uk/anzY34+GQFl10Z8Wi/gre5LBxYm3BkCowpSMOIwAYzkVn/MecnUnNVAlk3wpgv1p
         mac8ZaAzjG+/ItMFDVuSX4kdLu7WPVrLiqtaAjuwXHyHxMlnf+DoY5PFhg84GJvYITJ2
         Facw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506067; x=1779110867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iIqj3PJ8IFkl3jV3tX7I8ABRXAJUOvr2KgrwJ/yHDUM=;
        b=hb7MXT/etJZPymovsw5NShKmJmT6HH+w9XMm15cIcmdvGIaMxX8Jy8YlQzK+y+R46j
         kxEbf5sPmHx5LOKrWUnTfbAZOzCVUC2Sf1/GbB1+l/ohLodZ9htGdADM9Y133Nn9UT+W
         iUXZ/4zJzIBY5ERCcMp3bGMHfDhfO8AKBi7ptXKpJ1y86NjHohAuyTKNHBcOrHMlloz7
         8LknDYGxdLib0lDb38y2OJOkGZVo/LXQMjw8vrho9PlKFjlx08fpSWVcDT2CfVdZYnP0
         CHLCkVNNt8WzqeEQd54hQv23EnCL1SZ62zGv77uVRRxRCZB1WEzsGhiYKB/cgbvl3yWs
         wyYg==
X-Forwarded-Encrypted: i=1; AFNElJ/9MnLumfUT5DegPZiZzD99vkcEZxb71vtWuFTjEXk0tBWwO1yai3zJ4eotUNsjDsyO99cOwAakLG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYKIavf6VI28POFG1shwTs560znrVsIeNrvQDoMKGWGkayGW3F
	7RQFtvCDxzoLfK2++zaN33WhPXAnBxgYXvkXbHRlTszv69gTFlW5XgGS
X-Gm-Gg: Acq92OHSXSKwBWtYEa376LTvwEn1La2CxEFpEEo5E1qYh2PuUaaB5aGBC8QYIEKW9tG
	7DhaJpUkWmxMGR9yStgrqQBEB+efy/D3Dk/OAh+Ov8KAvl+yXHTgijuNiTM/JOe5RHlQABRW38B
	4d7rRkwGgDoeUFczNjoPB1DFfIdzWcVOIyNXRwjAd7e6UnKKXZ6h7M1qf1bkNKzZbPa+9sv9p2q
	y/fKA7/b+Y6y2G27j9KUiOeWxP+idFWPI7URlNaRBGhDxCq4gYmc0zpYL5UZpkp/H8mCrRYt5H1
	58qrMxFHI1JKqriTnZ9m3pvNzw7ie31BAdXfHBzqvTgtN2xXCmdiZa9EUog9DEqAQXnkcJ4kSTc
	vqhNkINB76RL9j2HTAldaOM6iVxNko2uBspNXIHMLEPOAkwBd7+yGx1VEuYsPwbZNUV7Y6l1/O/
	mP+Vp1k7tnj/OEwf1ef187Xg9avHX5ZH/UFrfVtFblL816ZdaNlIaT6vofnTXZ
X-Received: by 2002:a05:600c:17d8:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-48e51f46abemr229099115e9.28.1778506066819;
        Mon, 11 May 2026 06:27:46 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a6470sm22087839f8f.7.2026.05.11.06.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:27:46 -0700 (PDT)
Date: Mon, 11 May 2026 14:27:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Manuel Ebner <manuelebner@mailbox.org>, andy.shevchenko@gmail.com,
 apw@canonical.com, dwaipayanray1@gmail.com, joe@perches.com,
 kees@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 workflows@vger.kernel.org
Subject: Re: [PATCH 2/2] scripts: checkpatch.pl: add warning for strlcat()
Message-ID: <20260511142745.7757b1b2@pumpkin>
In-Reply-To: <87a4u6w3ez.fsf@trenco.lwn.net>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
	<20260510165649.57880-2-manuelebner@mailbox.org>
	<87a4u6w3ez.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 May 2026 06:12:36 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Manuel Ebner <manuelebner@mailbox.org> writes:
> 
> > add a warning for strlcat()
> >
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > ---
> >  scripts/checkpatch.pl | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 0492d6afc9a1..ca1a8e67d529 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -7085,6 +7085,12 @@ sub process {
> >  			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
> >  		}
> >  
> > +# strlcat uses that should likely be
> > +		if ($line =~ /\bstrlcat\s*\(/ && !is_userspace($realfile)) {
> > +			WARN("STRLCAT",
> > +			     "Prefer seq_buf_printf() over strlcat - see: https://github.com/KSPP/linux/issues/370\n" . $herecurr);
> > +		}  
> 
> Using seq_buf_printf() requires switching over to the seq_buf API in
> general, it is not just a simple substitution, so this advice may prove
> unhelpful to many.

And I'm not sure the external url is a good idea.

> 
> jon
> 

