Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3031416DEAC
	for <workflows@vger.kernel.org>; Wed, 16 Oct 2024 18:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729101751; cv=none; b=oPTvr5nDF8SxmIY+3fCy7+JoYACJSqZWHcHrONBpgpES0J4PM6uJw9CVs6YiJLCvaLwMKBF3lqpxi/8X5BczQwPPTLoWZq2fwCq+fqrx4fWQXjNzC/kt7EfLhj00zoA/0OsUhbCum9NUimExQXlZPOJulTnDXQSc3AF2MNDOeSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729101751; c=relaxed/simple;
	bh=pi9H4WMd9SM5eDGDfTbd2w4J6yN+KVgePTHA6Uemi7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjNX29x/6n/7tfUyZEhT1FpIKje96tFOYZ+o6U4ND/AqbDTyQDUZNwW+qZ9KfjRpdyFzwsyYIAB2BkRyxOQW5Uky0eVt0+oBURY1uiymG8wE+ML7qrKQPVqyjR92cpG8yMJSF11Wj07gEP4HlnWuQKL8xZWlEy3BnocAXK4mTm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W2V2yK56; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W2V2yK56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729101747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pm8JXLoAKsq/UPs87DRA42ZRFshFvHDgnF3dqmUbVPs=;
	b=W2V2yK56EAji18W2SKo0fzOZ1wj4ZK6p3Umi79n/PmcZzR/9CWRiieCewCzIfN7glXwa5v
	AFuqozYGV4+723T2x6iAYYD8rBr9h3ddTPJ51iRLer1xA1cn7+Q4xqs98v4fvPvC0v7Gn5
	taQgkCwYGj/ny0n/rE6E01wbhJ2lkKU=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-ey_61g-yOyqiQBORbtJcww-1; Wed, 16 Oct 2024 14:02:25 -0400
X-MC-Unique: ey_61g-yOyqiQBORbtJcww-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-288485b2358so56942fac.3
        for <workflows@vger.kernel.org>; Wed, 16 Oct 2024 11:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729101745; x=1729706545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pm8JXLoAKsq/UPs87DRA42ZRFshFvHDgnF3dqmUbVPs=;
        b=n9GNE3qkSQL+N0zr1XjstRbk/Xr6oucnPOHBK/8CP4QDYdDQEy1qqTHAMT+Nl+JE+S
         mC+UcySMrt8q86oNC/LcA2l0YWZ/ZFjH2EDUaRO7y6/dbEamcpkzglJ6LpuOtWzYsVaB
         b0xBN0trZwguq+uF1X11890d01crJi58EFCBUVJDZfwNwXyGhO7zxD4yPGNU3SeGLKcQ
         9beImtoVcKbP3wouRo9VT0xKUIMwug7NycUS0oQSKwXivDJKjNjbJhqdZkJ414L2jtuU
         7Qtiowa1T9lOD7MAkj8xjwjtUKlIE52YPSFK0gJlnSFpLCeJKhTM69HvjJZDW57PktjV
         x/bA==
X-Forwarded-Encrypted: i=1; AJvYcCVGasKW6Y1aza0cq536+j8gh0qotvAQcTh+ayzUJoy1bdXCYw2GV2ZO4KhNag6juVV12Fbj80yucjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlkm0sZHwXq0wxvIBsCBzVaQXI+tsH4TJ3porSmbSAOCp5uwP
	GV2SNclbejunIk3GweKEceJ6X1QWzxi2fFTrlKoBnX1qdMsjaP2qYaNIfWSW7lWcEZ0Jsj6TI8K
	cIVyHCf6CvlNN39G82xNBlYIn798BEVZt6B2qKqlE9dd7yV78hjbfPubHvd3GZq0nq5v3vivSVt
	s7gzkFJ2iwe/CzgfqBYYVSaV0IPS1GiVOymoiHL5p0
X-Received: by 2002:a05:6870:c1d4:b0:277:db7f:cfb2 with SMTP id 586e51a60fabf-2886dd7375cmr15544360fac.14.1729101744973;
        Wed, 16 Oct 2024 11:02:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDNQLSYZavey/MCZZTTF4pekCcu5Qvgrv7LS/txIy8CC0Uej3nbZiDkCn/5iIUKyyCta1WoXvJIzg7cctLQX8=
X-Received: by 2002:a05:6870:c1d4:b0:277:db7f:cfb2 with SMTP id
 586e51a60fabf-2886dd7375cmr15544335fac.14.1729101744699; Wed, 16 Oct 2024
 11:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK18DXYitS7hL1mA3QsPLmW9-R0q6Kin0C5Uv9fj=uS90WSnxA@mail.gmail.com>
 <MW5PR13MB5632C443F9D7E658168BC77DFD452@MW5PR13MB5632.namprd13.prod.outlook.com>
 <Zw-7Tydnaaj3XAQo@yuki.lan>
In-Reply-To: <Zw-7Tydnaaj3XAQo@yuki.lan>
From: Donald Zickus <dzickus@redhat.com>
Date: Wed, 16 Oct 2024 14:02:13 -0400
Message-ID: <CAK18DXYDxfd3cqUdUjLvzMMxvkCma-H6qWbgmAgqyRTNb00TWA@mail.gmail.com>
Subject: Re: [Automated-testing] [RFC] Test catalog template
To: Cyril Hrubis <chrubis@suse.cz>
Cc: Tim Bird <tim.bird@sony.com>, 
	"workflows@vger.kernel.org" <workflows@vger.kernel.org>, 
	"automated-testing@lists.yoctoproject.org" <automated-testing@lists.yoctoproject.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, kernelci <kernelci@lists.linux.dev>, 
	Nikolai Kondrashov <nkondras@redhat.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, 
	kernelci-members <kernelci-members@groups.io>, 
	"laura.nao@collabora.com" <laura.nao@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cyril,

On Wed, Oct 16, 2024 at 9:11=E2=80=AFAM Cyril Hrubis <chrubis@suse.cz> wrot=
e:
>
> Hi!
> > Just saying "LTP" is not granular enough.  LTP has hundreds of individu=
al
> > test programs, and it would be useful to specify the individual tests
> > from LTP that should be run per sub-system.
>
> A few thousand tests to be more precise, and also the content tend to
> change between releases, be it test additions or removal and I do not
> think this level of changes is somehing that makes sense to be tracked
> in such database.
>
> It may be better to have more generic description of LTP subsets, there
> are a few obvious e.g. "SysV IPC" or "Timers", and have the LTP
> testrunner map that to actual testcases. The hard task here is to figure
> out which groups would be useful and keep the set reasonably small.
>
> I can move this forward in LTP reasonably quickly we get small list of
> useful groups from kernel develpers.

Thanks!  The thought was if we wanted to encourage contributors to run
these tests before submitting, does running the whole LTP testsuite
make sense or like you said a targeted set would be much better?

Cheers,
Don

>
> --
> Cyril Hrubis
> chrubis@suse.cz
>

