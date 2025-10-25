Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C84B220F38
	for <workflows@vger.kernel.org>; Sat, 25 Oct 2025 06:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761373447; cv=none; b=iVi1e0kEOpbOWju0cG5Ry000gZFcuJaePMyRbOJs8E4lN5PTL7RGKtHmaC61Q5yT2KhkY+0a7ZdrpkosMGakd8iiT/vdNPk9RPB9LsyqG7PQvghuEND7qJOK9uslZQy9KKSqlO2UTvxcsj9Ag12giGA43ukSrW8qep/y0CLZNDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761373447; c=relaxed/simple;
	bh=FMw0+LtxF1XFnxeM6wfrdoWVKBhlpw1rYFoS6IMYePo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=opVdpbL4awnJgHlqxGju82n0vhZxeuY/J7IeOvB0QKxK5WPCACyNahX4iNpYOocYruB+Osv6VANtPTJLsV2Y1rHSpWxwfJT4X9a2ZS0DUuX58lT0pyKFVz+0REZ+VGo+/xm3KgZIfHoMSkpkTX0CfVyDcryvMHUk1l0Sp82Tx/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNzcWh2b; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNzcWh2b"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2698d47e776so23383785ad.1
        for <workflows@vger.kernel.org>; Fri, 24 Oct 2025 23:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761373445; x=1761978245; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Uyn+lqnfj+DF2Mnswe7yP+PmxmYmbtnyxPSWDdj2IYQ=;
        b=XNzcWh2bsHRhXIg5xNeAIKsJqhwchKF8+WPtWD5qzgB821m367N5VOXqOYeVdByUsT
         f21ry8atQ2Z/BMPzisV1yEM5pma5LujBytxUM1X1Nnvn2NWepzUUnP/X6YCAiZ4viYa7
         4ou9prwSwJLccbf3JmbYhKaGuEgiKeW45whAy1pSpbtXjxRnXMnxOzuk/QH7rwypRupH
         tqp2FvRl7v5fP1cmXi+Zt6EzSsTmSRAzSgkP9HZ7mNjHQ0fm0W8e9dl07UdmM6LF5r19
         ld+/wDwtZDehK7hQPL6Ig6kulgA5qKcZUUk2Q8+7Gmzweh0qV+7xgz8/NX//HwwKaHq8
         H3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761373445; x=1761978245;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uyn+lqnfj+DF2Mnswe7yP+PmxmYmbtnyxPSWDdj2IYQ=;
        b=VKJOr2BjWR+v9lskeDFJ++fnFaAXhWW/dQIN5RNMtvdaT/lR8wvYfR8h00IqqvHuFI
         UFsUKNXgjjAV7nYu7YLnfVhj/RqR6A4XEJaF9EQ8Wop4kp5oSX64+QuIpBsoUF+tDBJm
         iAmdbbBce8HDsN5ZkiBE+wCZfHDy2VIiP5jbq4oCisQxEB6HSty6cutvWj/h9j3pMVVE
         yYZunDM5qDvPRQX0aKVClA6off0leC8XxEIt8QgAFHEujA9zHxWUQCScJ3WMeYXIeS9n
         ofbrGSyihZZkF8rysPinXXOhzuY5T8XiKtGdEL/EOlAgchJzNp4TEmYdmXK9lyYyx5DN
         iI6A==
X-Forwarded-Encrypted: i=1; AJvYcCWasgvlCuoZVqLGguyab0+SWGuMXDDZ7/9io6HcmmKVVjEB3jfgkKieH95A3I8DRW3Esl28tgLIHXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzku9n7UbW7MUQb/oKuGJSo/VuqORYtCiFENFSfzlsI/PjQrCsa
	TgQWXhCBgsPXNbOr7oPZ23Gnm7oTk22w86t6UtUZSDS5awuKH/dNT2z9
X-Gm-Gg: ASbGncvSBtUd392QTONImpT/yuB/eYsM1+tEE6bc8Kh+k5YeiPbHWnhQ80e/fEOnf9P
	FqDLh+NukkiXWNC2ykZih8UDY29KBbXeTPc5KXHBrVNyBFmkI1/Fh59mhEvAhl0RrgD91LWlAa7
	Au2gAA1TjJ0LNv23Kj9gySCIH3nIfyyoio3jPnhutboWQ/6Jwz+GvkcgQ5Ia4wWw5ftlNQ4ofzu
	onssnDkAuxVUfeaXTHBTy2opb34NqHCm6PGHVAnbVmbBAJ3oL+iLEXbEl6vF2SPgcbgSNbeHS+B
	qdsuB03QSZqAdF9UcGZryWADDTtXjk4U3mEnwICXgnENdtUwJoH0Fi0MnONfVi0iJXPXdZ0hSZD
	U4jMr2KTe51IWI/Qa0YbMQX4WGpMNli8SlP/ZODHX3Xrfo01UNMHR90GeC8n1MYWn/uP6aEbgW7
	uOoor+ijgW/sFza1KbQtq/ALDtYG1S5UkpDFS8cI/fwxhBCB05v3TBz8Gn
X-Google-Smtp-Source: AGHT+IHplQPVfCIQoY8PHDd3B2J4jw0QISC8FZ6gWYBjJGGEKcAtDwmwgPaM4vZb11xkzDseTqP+IA==
X-Received: by 2002:a17:903:249:b0:25c:8005:3efb with SMTP id d9443c01a7336-290cba423a6mr366592795ad.54.1761373445251;
        Fri, 24 Oct 2025 23:24:05 -0700 (PDT)
Received: from ?IPv6:2401:4900:88f6:d7b0:443:a828:b6ba:688d? ([2401:4900:88f6:d7b0:443:a828:b6ba:688d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42ea7sm12204175ad.101.2025.10.24.23.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 23:24:03 -0700 (PDT)
Message-ID: <81e6af8eea5b0399d1685797d0ea6a6ebc273270.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] add check for pointers with __free attribute
 initialized to NULL
From: ally heev <allyheev@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn	
 <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, Jonathan Corbet	
 <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
 workflows@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Hunter	 <david.hunter.linux@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>,  Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm	
 <linux-pm@vger.kernel.org>, dan.j.williams@intel.com
Date: Sat, 25 Oct 2025 11:53:56 +0530
In-Reply-To: <aPvAm1E7CvQfOIuS@stanley.mountain>
References: 
	<20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com>
	 <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>
	 <aPvAm1E7CvQfOIuS@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-24 at 21:08 +0300, Dan Carpenter wrote:
> On Fri, Oct 24, 2025 at 10:59:16PM +0530, Ally Heev wrote:
> > pointers with __free attribute initialized to NULL
> > pose potential cleanup issues [1] when a function uses
> > interdependent variables with cleanup attributes
> >=20
> > Link: https://docs.kernel.org/core-api/cleanup.html [1]
> > Link: https://lore.kernel.org/all/68f7b830ec21a_10e910070@dwillia2-mobl=
4.notmuch/
> > Suggested-by: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Ally Heev <allyheev@gmail.com>
> > ---
>=20
> I don't think this patch is a good idea...  There are two issues to
> consider 1) The absolute number over warnings.  500+ is too high.
> 2) The ratio of bugs to false positives and we don't have any data on
> that but I bet it's low.  It needs to be at least 5%.  For anything
> lower than that, you're better off just reviewing code at random
> instead of looking through warnings.
>=20
> regards,
> dan carpenter

makes sense

General question about the process for my understanding:
Is checkpatch run on full tree by CI or someone and results reported
regularly ? My understanding was that we would run it only on patches
before submitting them Or we just run it on full tree before adding
new checks to understand if they are catching real issues
