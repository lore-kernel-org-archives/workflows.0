Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED1334A3DB;
	Wed, 15 Apr 2026 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776253426; cv=none; b=GzNOaZUfdTH9ifQgwZbHlozQTSJkjtJu+PfnYtFdLOla1RCzuTm3u4xeaxCLGszKF9ySQPIYU7N4JtkiwCcIBhI3GiioBc6kmi64JcoORJeQ7BRLtj0F3cpKGSxakYrZiRMiG3ieAXRqarWI7qSq7eVWNVvFAyUBuP1Jxqbl9Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776253426; c=relaxed/simple;
	bh=tXfp6De6v1HqoOJvt/plPmKQ+uXgDMHWC7/2Mze9maI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sqa6tL5Zn+0s4wlQkDZeh8+JXxK7HbWEEd1wqeTviGtvrJVM378WmYvCvlqbjHoK/epjpPIPhX3FMJ8EtF4P+pR18mBhga68QyBln+8CgqYfAnmt3QUjFZn36nWe8cjencSb3BPtIE9oreyW1mC5hUNX5Zbt6M13h/pnxtkpA9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBSF2SGt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBSF2SGt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F790C19424;
	Wed, 15 Apr 2026 11:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776253425;
	bh=tXfp6De6v1HqoOJvt/plPmKQ+uXgDMHWC7/2Mze9maI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VBSF2SGtgYiM7uY/0Z+w5O/RqFH+t9b676zR/R2UHTK29EzET7sAXbWpN0i6CN9/r
	 37FOmNx5nnhlc7J3C/1R4IaLWQJ5bXBMonblOIuqpCuSu2rCduVb5aYuRqYKXRY2i+
	 3PQGNM2UyfrIRDWBVcFvdz6Au/NlefShArQgNyG1f5B4WeYbfdBEJtjA9VzgNpRqUm
	 awVhvJRBFdgR909xhFmM/6zFdJAlRfe7t1QiBWNEd7jr6q7V4iGorNtGsXNikmsXlh
	 jsDuSm/ekcpKbHWXgRz8toLPHyg8z2jU2n34z0GEzyejCcCl23Zz5/rWhs4dKAyD6U
	 l2hbn2ZdrD+jw==
Date: Wed, 15 Apr 2026 13:43:41 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
Subject: Re: maintainer profiles
Message-ID: <20260415134341.002745d2@foz.lan>
In-Reply-To: <d8804a85-dd2b-481e-903f-c6fea5d24c97@infradead.org>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
	<20260410101239.04c87f26@foz.lan>
	<d8804a85-dd2b-481e-903f-c6fea5d24c97@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Apr 2026 16:54:00 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Also, does anyone know why some of these profiles are numbered and some
> are not?  See
>   https://docs.kernel.org/maintainer/maintainer-entry-profile.html#existi=
ng-profiles
> for odd numbering.

Patch 9/8 fixes it, while solving other issues:

- https://lore.kernel.org/linux-doc/cfff2b313d1f79a5919f400020a1b1a4064a714=
3.1776252056.git.mchehab+huawei@kernel.org/T/#u

Basically, it creates a hidden TOC which is not displayed, creating
this ReST output:

	- :doc:`Arm And Arm64 Soc Sub-Architectures (Common Parts) <maintainer-soc=
>`
	- :doc:`Arm/Samsung S3C, S5P And Exynos Arm Architectures <maintainer-soc-=
clean-dts>`
	- :doc:`Arm/Tesla Fsd Soc Support <maintainer-soc-clean-dts>`
	- `Audit Subsystem <https://github.com/linux-audit/audit-kernel/blob/main/=
README.md>`_
	- :doc:`Damon <../mm/damon/maintainer-profile>`
	- :doc:`Documentation <../doc-guide/maintainer-profile>`
	- :doc:`Google Tensor Soc Support <maintainer-soc-clean-dts>`
	- :doc:`Kernel Nfsd, Sunrpc, And Lockd Servers <../filesystems/nfs/nfsd-ma=
intainer-entry-profile>`
	- :doc:`Kernel Virtual Machine For X86 (Kvm/X86) <maintainer-kvm-x86>`
	- :doc:`Libnvdimm Btt: Block Translation Table <../nvdimm/maintainer-entry=
-profile>`
	- :doc:`Libnvdimm Pmem: Persistent Memory Driver <../nvdimm/maintainer-ent=
ry-profile>`
	- :doc:`Libnvdimm: Non-Volatile Memory Device Subsystem <../nvdimm/maintai=
ner-entry-profile>`
	- :doc:`Media Input Infrastructure (V4L/Dvb) <../driver-api/media/maintain=
er-entry-profile>`
	- :doc:`Networking Drivers <maintainer-netdev>`
	- :doc:`Networking [General] <maintainer-netdev>`
	- :doc:`Risc-V Architecture <../arch/riscv/patch-acceptance>`
	- `Rust <https://rust-for-linux.com/contributing>`_
	- `Security Subsystem <https://github.com/LinuxSecurityModule/kernel/blob/=
main/README.md>`_
	- `Selinux Security Module <https://github.com/SELinuxProject/selinux-kern=
el/blob/main/README.md>`_
	- :doc:`Vfio Pci Device Specific Drivers <../driver-api/vfio-pci-device-sp=
ecific-driver-acceptance>`
	- :doc:`X86 Architecture (32-Bit And 64-Bit) <maintainer-tip>`
	- :doc:`Xfs Filesystem <../filesystems/xfs/xfs-maintainer-entry-profile>`

	.. toctree::
	   :hidden:

	   ../filesystems/xfs/xfs-maintainer-entry-profile
	   ../driver-api/vfio-pci-device-specific-driver-acceptance
	   maintainer-netdev
	   ../nvdimm/maintainer-entry-profile
	   maintainer-soc
	   maintainer-soc-clean-dts
	   ../doc-guide/maintainer-profile
	   maintainer-kvm-x86
	   ../mm/damon/maintainer-profile
	   ../driver-api/media/maintainer-entry-profile
	   ../arch/riscv/patch-acceptance
	   ../filesystems/nfs/nfsd-maintainer-entry-profile
	   maintainer-tip

E.g. instead of showing the contents of the TOC tree, it shows a
per-subsystem sorted list of items. The TOC tree is used there just
to avoid warnings that a .rst file is not placed on a TOC.

The advantage of such approach is that there's now one item at
the list for each "P:" tag at MAINTAINERS. All of them are
displayed using the name of the subsystem as described there,
e.g. it outputs:

     =E2=80=A2=C2=A0Arm And Arm64 Soc Sub-Architectures (Common Parts)
     =E2=80=A2=C2=A0Arm/Samsung S3C, S5P And Exynos Arm Architectures
     =E2=80=A2=C2=A0Arm/Tesla Fsd Soc Support
     =E2=80=A2=C2=A0Audit Subsystem
     =E2=80=A2=C2=A0Damon
     =E2=80=A2=C2=A0Documentation
     =E2=80=A2=C2=A0Google Tensor Soc Support
     =E2=80=A2=C2=A0Kernel Nfsd, Sunrpc, And Lockd Servers
     =E2=80=A2=C2=A0Kernel Virtual Machine For X86 (Kvm/X86)
     =E2=80=A2=C2=A0Libnvdimm Btt: Block Translation Table
     =E2=80=A2=C2=A0Libnvdimm Pmem: Persistent Memory Driver
     =E2=80=A2=C2=A0Libnvdimm: Non-Volatile Memory Device Subsystem
     =E2=80=A2=C2=A0Media Input Infrastructure (V4L/Dvb)
     =E2=80=A2=C2=A0Networking Drivers
     =E2=80=A2=C2=A0Networking [General]
     =E2=80=A2=C2=A0Risc-V Architecture
     =E2=80=A2=C2=A0Rust
     =E2=80=A2=C2=A0Security Subsystem
     =E2=80=A2=C2=A0Selinux Security Module
     =E2=80=A2=C2=A0Vfio Pci Device Specific Drivers
     =E2=80=A2=C2=A0X86 Architecture (32-Bit And 64-Bit)
     =E2=80=A2=C2=A0Xfs Filesystem

Each of entry there with either a cross-reference to a document or
with a reference to an external site.

Thanks,
Mauro
