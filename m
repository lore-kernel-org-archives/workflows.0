Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4C312B93;
	Tue, 14 Apr 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776170256; cv=none; b=dr9wX+VNkLHJ4dnXu2hZ6PG12SBW3u/GesEA3MyAt7cmR9PdobaHDC1A+3tZ6+WZCIYrdohjoG+g3JRkoeD+qBIztEQ+9V6VBbEpN6/YdnzjBCOz4KN94cZysx/BeE1Ays6ebnoJqdwINlY/hXC5Sho57LvGSI3oxORLGtd0DYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776170256; c=relaxed/simple;
	bh=TAFsEfXFc+yd4RbB1fzf5i9KuVoY9799G19Cyt/PRkw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fp8xYDvfdd0bCyYtm+L86dL91KxXNv+NS0k2qevLOHp22iRHqfciGek4tZquc3C2ukRQkcir4QJSZyIYV1JKAvSDFCkb3W45lY2janmQUr3LuOqXp3klA2JJy6PqvzOA4bx2tWSr4HS2F/cqXMpBauQhDgLuxBQ/e+KillxPQBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TY0XNgqx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TY0XNgqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2724DC2BCB0;
	Tue, 14 Apr 2026 12:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776170256;
	bh=TAFsEfXFc+yd4RbB1fzf5i9KuVoY9799G19Cyt/PRkw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TY0XNgqxeg9kruWk2YseGOWZWZMOB5wTU2fdyNKznDKRXCYpuSx3uz/H8uBXt5FL+
	 inVAwvjIYobIMYIumAivVZLBW96XshYnx6QVLBJnSJmuPC/jnQPkm2Sh0Ib/WnqwYz
	 bl43yKZm2DHGyQ9VJ3Rb98Zyal+pm2QAEukgYwaNLeSc3SLwhutgeNEbEzYH51ohwn
	 Vu2x7CvH86QDAvvEdfwTUm1VBZMuvVoKLRAffGipALqy+Todn3QFERAA11TeG86h09
	 jJrlTaRvA6piLn35CUD2EIIAFK2r8SQoYnKHklZR2zjOg/5tPLciYnyJplTrYRhS54
	 pIEeK3HRYP+Mw==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCd1K-00000003t3X-02Ua;
	Tue, 14 Apr 2026 14:37:34 +0200
Date: Tue, 14 Apr 2026 14:37:33 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Dan Williams <djbw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Documentation <linux-doc@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Kernel Workflows
 <workflows@vger.kernel.org>
Subject: Re: maintainer profiles
Message-ID: <20260414143733.6cbd6d62@localhost>
In-Reply-To: <69dd6299440be_147c801005b@djbw-dev.notmuch>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
	<87wlyawum7.fsf@trenco.lwn.net>
	<69dd6299440be_147c801005b@djbw-dev.notmuch>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Apr 2026 14:39:37 -0700
Dan Williams <djbw@kernel.org> wrote:

> Jonathan Corbet wrote:
> > Randy Dunlap <rdunlap@infradead.org> writes:
> >   
> > > Hi,
> > >
> > > Is there supposed to be a difference (or distinction) in the contents of
> > >
> > > Documentation/process/maintainer-handbooks.rst
> > > and
> > > Documentation/maintainer/maintainer-entry-profile.rst
> > > ?
> > >
> > > Can they be combined into one location?  
> > 
> > Late to the party, sorry ... the original idea, I believe, was that
> > maintainer-handbooks.rst would be for developers looking for a guidebook
> > for a specific subsystem, while maintainer-entry-profile.rst was about
> > how maintainers themselves should write their subsystem guide.
> > Doubtless things have drifted since then...  But the intended audiences
> > were different, so it might be good to think about bringing them back
> > into focus.  
> 
> Right, I think something (roughly / hand-wavy) like the below is the
> intent. However, as I write that I notice that the combined list is a
> bit of a mess. I also notice that there are more "P:" entries in
> MAINTAINERS than there are entries in this maintainer-handbooks.rst
> list.
> 
> So this probably wants to be a script that can build Documentation links
> from MAINTAINERS, or otherwise provide a script for developers to query
> a kernel tree for additional submission guides. It is probably not as
> important for the built docs to link all guides as it is for developers
> (or their agents) to live query a tree they are developing against.

There is already a Python script which parses MAINTAINERS file
(Documentation/sphinx/maintainers_include.py).

Currently, it expects a Sphinx meta-tag inside
Documentation/process/maintainers.rst:

	.. maintainers-include::

I guess it shouldn't be hard to add support there for a

	.. maintainers-profile::

Making it creating a set of cross-references is probably easy. Not
sure how easy/hard would be to create a TOC tree, though.

> Note the problem goes both ways, there are P: entries not in the
> combined handbook list, like the Security subsystem, and there are
> handbook entries without a P:, like the Tip tree.

Assuming we add such extension, we'll need to sync the P: entries.

I'll take a look on trying to extend the Sphinx maintainers
extension.

> 
> diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
> index 6020d188e13d..58e2af333692 100644
> --- a/Documentation/maintainer/maintainer-entry-profile.rst
> +++ b/Documentation/maintainer/maintainer-entry-profile.rst
> @@ -92,24 +92,8 @@ full series, or privately send a reminder email. This section might also
>  list how review works for this code area and methods to get feedback
>  that are not directly from the maintainer.
>  
> -Existing profiles
> ------------------
> -
> -For now, existing maintainer profiles are listed here; we will likely want
> -to do something different in the near future.
> -
> -.. toctree::
> -   :maxdepth: 1
> -
> -   ../doc-guide/maintainer-profile
> -   ../nvdimm/maintainer-entry-profile
> -   ../arch/riscv/patch-acceptance
> -   ../process/maintainer-soc
> -   ../process/maintainer-soc-clean-dts
> -   ../driver-api/media/maintainer-entry-profile
> -   ../process/maintainer-netdev
> -   ../driver-api/vfio-pci-device-specific-driver-acceptance
> -   ../nvme/feature-and-quirk-policy
> -   ../filesystems/nfs/nfsd-maintainer-entry-profile
> -   ../filesystems/xfs/xfs-maintainer-entry-profile
> -   ../mm/damon/maintainer-profile
> +Maintainer Handbooks
> +--------------------
> +
> +For examples of other subsystem handbooks see
> +Documentation/process/maintainer-handbooks.rst.
> diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
> index 976391cec528..bc9299a04b1f 100644
> --- a/Documentation/process/maintainer-handbooks.rst
> +++ b/Documentation/process/maintainer-handbooks.rst
> @@ -9,14 +9,33 @@ The purpose of this document is to provide subsystem specific information
>  which is supplementary to the general development process handbook
>  :ref:`Documentation/process <development_process_main>`.
>  
> +For developers, see below for all the known subsystem specific guides.
> +If the subsystem you are contributing to does not have a guide listed
> +here, it is fair to seek clarification of questions raised in
> +Documentation/maintainer/maintainer-entry-profile.rst.
> +
> +For maintainers, consider documenting additional requirements and
> +expectations if submissions routinely overlook specific submission
> +criteria. See Documentation/maintainer/maintainer-entry-profile.rst.
> +
>  Contents:
>  
>  .. toctree::
>     :numbered:
>     :maxdepth: 2
>  
> +   maintainer-kvm-x86
>     maintainer-netdev
>     maintainer-soc
>     maintainer-soc-clean-dts
> +   maintainer-soc-clean-dts
>     maintainer-tip
> -   maintainer-kvm-x86
> +   ../arch/riscv/patch-acceptance
> +   ../doc-guide/maintainer-profile
> +   ../driver-api/media/maintainer-entry-profile
> +   ../driver-api/vfio-pci-device-specific-driver-acceptance
> +   ../filesystems/nfs/nfsd-maintainer-entry-profile
> +   ../filesystems/xfs/xfs-maintainer-entry-profile
> +   ../mm/damon/maintainer-profile
> +   ../nvdimm/maintainer-entry-profile
> +   ../nvme/feature-and-quirk-policy

Sounds good on my eyes.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
Thanks,
Mauro
