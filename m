Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862FC2F851;
	Sun, 12 Apr 2026 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775975480; cv=none; b=QD+uVIdZ3qwl47LwFYlGsN650lAQCZG/opcfE4EefX+sInqP02jZvrpwhO8y7E3pYu1QhDuE8IrEdjBunBWjOOSFylR0KAMRvgr+bi59mJ8nzpiH3v/6znjLz5GtowhsY2D7VQCL0UBI9e4U/06YWFuPOoMietCBOiyv4TtiNMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775975480; c=relaxed/simple;
	bh=IvruJ7dlRUKMggEOJkpuG6YZxAyW1/VRr6n/EQyPckQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q0ctPvFx78fZT15KbA0C86bnUVYE8iaE2c/ug5ofcbOsYJtstHxNefStgNUGXKwVTQiRdp4G9Lp+WG6pwRitLdxVW6HFz0xjgWjnI6l99wqLt/3Pq4sJeKybBA6KiXhKL1Vbo/DgHm81aDEgA3vWoneSOrLccUjfqytreIGG9Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTNxGS/A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTNxGS/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69596C19424;
	Sun, 12 Apr 2026 06:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775975480;
	bh=IvruJ7dlRUKMggEOJkpuG6YZxAyW1/VRr6n/EQyPckQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tTNxGS/ABZx+NBgFFTkF1LFcHuiTf4NXYxa6cOHpnKhgPhSRBNx+kvu+b/ZOG0Xbd
	 Vp5XCZvowLShZBSr7jGGYoMhLGFYsoYnkH7L5rf2o3vsy6y0PTD9QkwB88zMkRiqjd
	 mWhTMHKF7qLO18uyph5pFuCF32AvKIpNuuVT42SIKt/MbHcLDTRsBx9BMvXwjpExZQ
	 9nGKfGO/3xWBBE1eexqwWbmLX5SRkg9HpQItwg+mingaYWym/jIDCpGPThS2AJGfqa
	 hQ1dk1OUjwKq9mPsJ29mOndWH5ulGMEUWoKSwUKtuxIHx3qfne4aF0zyq1Dc8FxePB
	 Kp6DHy0qhyTQQ==
Date: Sun, 12 Apr 2026 08:31:14 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Workflows <workflows@vger.kernel.org>, Dan Williams
 <dan.j.williams@intel.com>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: maintainer profiles
Message-ID: <20260412083114.3cadb4d5@foz.lan>
In-Reply-To: <a7421a41-458a-4925-a804-e31e2552c79e@infradead.org>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
	<20260410101239.04c87f26@foz.lan>
	<d8804a85-dd2b-481e-903f-c6fea5d24c97@infradead.org>
	<a7421a41-458a-4925-a804-e31e2552c79e@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Apr 2026 17:02:56 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 4/11/26 4:54 PM, Randy Dunlap wrote:
> > Hi,
> > 
> > On 4/10/26 1:12 AM, Mauro Carvalho Chehab wrote:  
> >> On Thu, 9 Apr 2026 17:18:39 -0700
> >> Randy Dunlap <rdunlap@infradead.org> wrote:
> >>  
> >>> Hi,
> >>>
> >>> Is there supposed to be a difference (or distinction) in the contents of
> >>>
> >>> Documentation/process/maintainer-handbooks.rst
> >>> and
> >>> Documentation/maintainer/maintainer-entry-profile.rst
> >>> ?
> >>>
> >>> Can they be combined into one location?  
> >>
> >> Heh, from the 5 entries at maintainer-handbooks.rst:
> >>
> >>    maintainer-netdev
> >>    maintainer-soc
> >>    maintainer-soc-clean-dts
> >>    maintainer-tip
> >>    maintainer-kvm-x86
> >>
> >> we have 3 of them already there at maintainer-entry-profile.rst:
> >>
> >>    $ grep process/ Documentation/maintainer/maintainer-entry-profile.rst
> >>    ../process/maintainer-soc
> >>    ../process/maintainer-soc-clean-dts
> >>    ../process/maintainer-netdev
> >>
> >> It sounds to me that moving maintainer-tip and maintainer-kvm-x86
> >> to maintainer-entry-profile.rst would be enough to drop
> >> maintainer-handbooks.rst, keeping them consolidated on a single
> >> place.  
> > 
> > Yes, maybe. How about in the other direction:
> > move them all to maintainer-handbooks.rst?
> > 
> > After all, maintainer-entry-profile.rst says:
> >   For now, existing maintainer profiles are listed here; we will likely want
> >   to do something different in the near future.

(added Don and Thomas to the thread)

I don't have strong preferences, but the maintainer-entry-profile.rst
contains a "default" maintainership model, so, whatever file name,
I would preserve at least most of its contents somewhere.

Probably a more important discussions is where they should would
sit:

- at Documentation/process;
- at Documentation/maintainer;

Another option would be to move the contents from/two those two
books.

> > 
> > Also, does anyone know why some of these profiles are numbered and some
> > are not?  See
> >   https://docs.kernel.org/maintainer/maintainer-entry-profile.html#existing-profiles
> > for odd numbering.  
> 
> Because they are numbered in their own respective documentation areas...
> 

Yes: they're actually links to other places:

 .. toctree::
   :maxdepth: 1

   ../doc-guide/maintainer-profile
   ../nvdimm/maintainer-entry-profile
   ../arch/riscv/patch-acceptance
   ../process/maintainer-soc
   ../process/maintainer-soc-clean-dts
   ../driver-api/media/maintainer-entry-profile
   ../process/maintainer-netdev
   ../driver-api/vfio-pci-device-specific-driver-acceptance
   ../nvme/feature-and-quirk-policy
   ../filesystems/nfs/nfsd-maintainer-entry-profile
   ../filesystems/xfs/xfs-maintainer-entry-profile
   ../mm/damon/maintainer-profile

On most cases, the profile is located together with other
subsystem-specific docs, as it makes easier to maintain there,
together with other documents from a given subsystem.

It also saves the need to add extra entries at MAINTAINERS
file.

Thanks,
Mauro
