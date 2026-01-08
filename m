Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ECF4D3DCC
	for <workflows@vger.kernel.org>; Thu,  8 Jan 2026 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880879; cv=none; b=VnLLBGNeTBtBbRP06rKEUedDfrppxrDvaeauNCfeIrqvE+oz07QYflRXZna2FdKenoNXHWK2GKR1Dp06G6WjjPuS5/1bKs7p0n1sKtcwiPv/A/p/rX6KdtEE+60BkZ5xQXU4YjLyTi7Nw2cO0NrdwYmTA+9SAReH9Co/q+jokFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880879; c=relaxed/simple;
	bh=Olp/7PDcp4pfbc+UbzZJFHgTZlJf7wLjtACvo1ZkneQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pV8ZqRpRIYjs+QAWdEN3KAbdlLouFFqpblvw2oqfoGNG9QupVKlhgpV98GZE16O5cl6QL18HFK0i/ryxusC3JL0oQbEftXW5uQ49vqzbflDE8EyEu2G7L71TUd5HQ6vpR55ZVDi7+D5sIAQyAgw6LE9pPo5eSNn+7N0sXfGoook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G8v7PEWq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lRHoki70; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G8v7PEWq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lRHoki70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767880877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CYSOF6mF7x3oRna/23J7sz+or3u51CnJIO5U+uhfHKM=;
	b=G8v7PEWq/r39HnaMYRW49UWr+uTp0IHgSy1qEWLMgzXFfWH96hA0GvRaxZ62KniPWys3J1
	daQI+KMzja1mgEmuTQQdjE8to5OPJN8meY5lwxvSBonwqILnyraHQgd8oZUt1A8wXPrFVh
	dIMrVbxO2XRl7BSKtx2+rL+RhrM94Fo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-NhsYOdyIObWfK6L1qWb4fg-1; Thu, 08 Jan 2026 09:01:14 -0500
X-MC-Unique: NhsYOdyIObWfK6L1qWb4fg-1
X-Mimecast-MFC-AGG-ID: NhsYOdyIObWfK6L1qWb4fg_1767880874
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43065ad16a8so1929602f8f.1
        for <workflows@vger.kernel.org>; Thu, 08 Jan 2026 06:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767880873; x=1768485673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CYSOF6mF7x3oRna/23J7sz+or3u51CnJIO5U+uhfHKM=;
        b=lRHoki70ZLSmFtg/LnHpDElIMk70cWm4dq3SKpQBmZvmIl1PbfipmBN1QUQIb7egub
         Wg33zMc/HP+5+7cfpFRw95WBFab/veZ2/kOkcm2sUXNFClC62Os/SosqInxvAFmiSeBQ
         amsU4eTSBsB9m16Lq+fZ3ixUnWFglZAXuzz8FVPknAwwAo4Q2/VL8nKhNHEaIcIKmp9Z
         7FkE3neBCHLP0CorKBvw43t4hcGsr7dq3g1Gl84klTwzeScwqgaTK49vSjhYgpBcIt9f
         RpOaoyJ00xGdPHNSo5v3erroOBoiNKwVzLYOmKrsHrCUd9Ba5bOEyXoG9vNnQ+PAIe8Q
         EEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880873; x=1768485673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYSOF6mF7x3oRna/23J7sz+or3u51CnJIO5U+uhfHKM=;
        b=B7O2bij+LpiLtKn02VekJUOqXCYN3jPL/cBtoQOd9x5tUh0c1pucAukt7605HWgQ5t
         jGW1VM5LGSeGZRH+Ba+Wg4P0acryfGTclNr6dNhBh2LSCBBnQNI8hscftkUq1XwbopEB
         2Rt9nVc5RMMv24XrJo8hWpv/7Z3LhIu3yEdLBu3ov94eX0o7yD7cuD97zzrI0Lx5QY46
         fJFfsXH9rbR9L+uGMobdUdD72awtDBaFOYBaDvIqiVd3uwZlBS5JuKzwaAnM6ENYlz1K
         KXSeBWvT1IrssNxJHFs69ZYzuCmID5/j7OUBtdWZRfSKmoCbN8V7LZXX/+fG+f/WLVBI
         UJ8g==
X-Forwarded-Encrypted: i=1; AJvYcCWt+VC6f/0bG5us+fNGiDRxRFUviJurGi4CBK1/OwRXxDF/R/nLOYBuDF4rz9Bf2CRkerVo2YyWefU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbcPDm8HV/9PPY6pAxEq5HUd0+ygwQ/JL1wtXLCxBHzdtlUm6Q
	hfSJuB7rn+vOhBy0e/UGJs+26pCD28+lxtU+lUvSNtBKiPz+IAEtRI3ja83qTzH6jYgTeZtJLdj
	jwck7rAH00qExfYk7gXwpLrT0EcS3OuaMQ8BuQ+n4gF1L5onE3Qi3t+ZrRNUwBQ==
X-Gm-Gg: AY/fxX4j3HHIhnZbdqDJZdRYLspEx4DXDgJ93P/Tk6DOci5DARDaLzfYxXNRyfXLdGG
	3lHmxbUMbqF+LPsntXuSPksQ9HiE0usXcQI2KtNyhuZDKtCJcnCRnNL8OWywM1NbOIgKFnFge3K
	tDv0MbMZQtM5AmxrTMR9FMCp4aFJHHkRerwq2nLx+UQ2H+ivoupwF9JGFz3HTou+2A50R2ym4i0
	oLgcdyvlPLI6wCV2QfQ5/RhHpX0DPWasl/BF26r5PqcJhoS1JXdJWqyebD7PLVGPah4id++z8NW
	diO/JzGrMZk1EQVUPKpOjnuVXzpqC9b423Cy7HGZtxUzFbfR43/BNIdlPp2ltQnDyw3Vf9jwn0L
	Uv04meuDV4ztPzAvQQkp9z02xuDaDMyZ/Fw==
X-Received: by 2002:a05:6000:4212:b0:430:f718:2388 with SMTP id ffacd0b85a97d-432c36280a4mr6556178f8f.8.1767880873568;
        Thu, 08 Jan 2026 06:01:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHm/a8Op4VxDRewkYvy7Ttp0lyCXYhf1e9mMnsO3z1A/P2eW7eKeXkhTeBr0UpojXRxrykzLA==
X-Received: by 2002:a05:6000:4212:b0:430:f718:2388 with SMTP id ffacd0b85a97d-432c36280a4mr6556129f8f.8.1767880873038;
        Thu, 08 Jan 2026 06:01:13 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm16341359f8f.4.2026.01.08.06.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:01:12 -0800 (PST)
Date: Thu, 8 Jan 2026 09:01:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
Message-ID: <20260108085215-mutt-send-email-mst@kernel.org>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>

On Thu, Jan 08, 2026 at 08:17:09AM -0500, James Bottomley wrote:
> > +you are expected to understand and to be able to defend everything
> > you 
> > +submit. If you are unable to do so, maintainers may choose to reject
> > your
> > +series outright.
> 
> And I thing the addition would apply to any tool used to generate a
> patch set whether AI or not.

Exactly. I saw my share of "fix checkpatch warning" slop. This is no
different.

-- 
MST

