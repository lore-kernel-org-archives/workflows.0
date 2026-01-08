Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3A13FB6A7
	for <workflows@vger.kernel.org>; Thu,  8 Jan 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882498; cv=none; b=lwyCBvWYtqv6PGKJdd/85PMPcjwYG6dJMghCD1UTNPDblMRA0I9mqIJQLpseZ93XQY33wMNR6CPLU3ce6yKB6vYDFHuqfpr4XF05G5cx5KLhceUPE3A2CLf2+zQw8wFR8UcV75EYz0c8k3PXS4uULfeG66AdzbtlWs038K6OtF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882498; c=relaxed/simple;
	bh=DE2y1HqrcJCFk/kMbi4+q2pd9Jr7TUkFtUY/sO4aTcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTkQ/RASO7smNcKZZ9VViov/GKuGunftCZm/M4LlR+9zStjDOY4W4tqbm3UkiZweHakeAbUbkDwHEDcgUtLQfZwz2JoDHWGOrOKVmZJtwsNE+zOW3+WqUh/PiKtzU+3gtVICOkvg4QLmvHg9r6aozUaqCqeWrA4fxnjL3H8Xu9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vh+BcDeU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Haxu8wuP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vh+BcDeU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Haxu8wuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767882495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BpTRDQlIxcFXCulwFzUoKCs9Qpfxsh6GYCQo5Gp9pJ4=;
	b=Vh+BcDeUHGVwj5ZYN8vhgWy2tt+4VvGiR4FAHhNmfVCnaN8ARa1D1+LK+rRIo5F0UiGHJB
	MxcNnp/9XngzEDqjfWkhlYYhYuTAckqQBwUtCJ4JX68ZzyRkFWW7UJag6NKM4ONl/F/RpL
	3dFwgNIYm8ILipwKxkidPOeEfQ57Gnw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-60Wu-nNeMk-Q4_uNpsRuUA-1; Thu, 08 Jan 2026 09:28:14 -0500
X-MC-Unique: 60Wu-nNeMk-Q4_uNpsRuUA-1
X-Mimecast-MFC-AGG-ID: 60Wu-nNeMk-Q4_uNpsRuUA_1767882493
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-477c49f273fso33098105e9.3
        for <workflows@vger.kernel.org>; Thu, 08 Jan 2026 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767882493; x=1768487293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BpTRDQlIxcFXCulwFzUoKCs9Qpfxsh6GYCQo5Gp9pJ4=;
        b=Haxu8wuP24n4Bxyl2M2XnBPoE4iZP9DP9YqhTfnKzqWLEo6doADw/s0DT5dJ2cHpRK
         5c4baiSP6hCII0L9Ua3GGDI7GKVzgAO14wzWRe7vYKcpvVyh4Tv4lDNusjSOsT/c7E/G
         hIU47bL0Cw3nEuKOyEnI+rV7l+qstDimHDYSYv8Z9PXu2m7wDHE+hayZmdqwCBPpxLwx
         iPhMOffr42UgFQzx6k/ec7k014MUdMulAx511fz7otLg/6BDhEVS8bhz6NIBRcTIrUMD
         Ii46aJnhJYRgz3jY4AiYjPsu6fqib+4tsKQA+mMETKSpYp3xkTonqQSFuDm41JCDIqG1
         ISLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882493; x=1768487293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpTRDQlIxcFXCulwFzUoKCs9Qpfxsh6GYCQo5Gp9pJ4=;
        b=HHmsFq4ivgVlFrsUV9xVpfRmue/obD/buoltfWB08NbblIK+0Qp1QTVrujJVfKzqiR
         XxQlUPVz3qZLPEmRKJVsIIIjp9o+NZCoc8UqTmOx5agklgBHnIQddz3se7qwPIrEISyl
         viaKHsLaLBevqoSCVe75YbIBVo0KML/zjQlesHnbeslK+4B+XPDgYVVEKdk4phm9EebT
         VdgkEcPW10AL9rkxWYZiHU3BmqZvO8Sv/nnDuPcIrwBRqt+kwSnG12q+w9f8v5U3kuxz
         UpWeOvf4o1REx53irZyoPdBHcg3LKxcM5xB5Fv51Wsxg6TGGv+WpFTXN7QwaIa2OY/KJ
         ZBug==
X-Forwarded-Encrypted: i=1; AJvYcCWgMIChkZCmEoQPK7BBid/2ALF6hnhQNUGEKpeqhw//DnDAcTiWgPNTyLxWudpsPtFaJrQvBg2RlGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSvKi1BXcNaBxqcto2Xy2XvEfzPd2l8O+3kDNsquAkxDIDeS2q
	3Mr2kDt2eNfR04sSGXe+3XLPs2KvCgDsszGHnMBogoVDwWMyxez+T9Qb6RyZUEkGBS8EZ+HSH/x
	kq9zlqrVODH1acwg7K0hX7YL2lajjM20105kQV3lw98Ipsl50Rn40Xr4JB0b/8Q==
X-Gm-Gg: AY/fxX7XJjfExk22yAoYDruyzcPyrbixpCKhCQcE/Qe5F+2fC4tJJLbpEIUTx/EJzif
	KQKp7ecaZoTs84J6kXY+BYA5OyDtCBivBOOoF0E1w1YXnv0leK+/cgtfx7TgAbxkS9/T9D/uvaI
	fCqCbH1w404qLzDiqvg7ydKpghM3YE1ZgVMWwZBuR2DUf8pA/WcUPLf2ALvwx4DdPHb6/TkKqRD
	EXV5KWULHA6hM/7TE8gl9i6EwbND50Tr3R4nU+N6SVLsy3Z57d9R8hbtJwUUqLR1gDviKmK4kSU
	wwEwcK4jyA1i9gNoPwu1F7WXjKQ7CYwzXWaAhsi9SG/p1zHKk5kR/b5FxXZ7wo1qcT/UoXFo7B/
	aiC5Qw+tt3WMCGTk4x7ntA07sqWIIshlyZw==
X-Received: by 2002:a05:600c:1994:b0:47a:80f8:82ac with SMTP id 5b1f17b1804b1-47d84b39efcmr69410785e9.26.1767882493197;
        Thu, 08 Jan 2026 06:28:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmzcZk9KuSpzaquYlUFM5a2Lb/iJQyuay1ZIAjDNNTlkmw0qm51UfxWeQb2Wpv2ceJg5hw/Q==
X-Received: by 2002:a05:600c:1994:b0:47a:80f8:82ac with SMTP id 5b1f17b1804b1-47d84b39efcmr69410425e9.26.1767882492692;
        Thu, 08 Jan 2026 06:28:12 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c6csm166770965e9.1.2026.01.08.06.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:28:12 -0800 (PST)
Date: Thu, 8 Jan 2026 09:28:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dave Hansen <dave.hansen@intel.com>, Dave Hansen <dave@sr71.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260108092635-mutt-send-email-mst@kernel.org>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <20260108085215-mutt-send-email-mst@kernel.org>
 <b8dc3dae-2d48-427a-be91-bcca53424d53@lucifer.local>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8dc3dae-2d48-427a-be91-bcca53424d53@lucifer.local>

On Thu, Jan 08, 2026 at 02:24:55PM +0000, Lorenzo Stoakes wrote:
> 
> At any rate, even if you feel this is exactly the same, you surely therefore
> cannot object to the suggested changes in [0] which would amount in your view
> then to the same kind of dismissal you might give to a checkpatch --fix series?

I have no problem with the suggested changes. I am especially happy that
they say "As with the output of any tooling".

-- 
MST

