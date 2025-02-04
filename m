Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665B52144BF;
	Tue,  4 Feb 2025 15:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684186; cv=none; b=UfURYa9zrv1h/J6NWzmYTYQvRsDUlCg4J94IjqeKYtfNTOeZCuudiy1fz80czQq1/8vFPwANT+IeI35r/zqXP+aSm0/wy9PA1NuV7s+jI0UQuj0Lx1i+99ZnkzEErWfJZesdDQZJV6uUwIaPuF4tgVmdqttjAp4cSRzXSg4oOgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684186; c=relaxed/simple;
	bh=nrMeiH7UVExN4XSEnV6FIGYBUi4IDz1jBq3iVTNjCUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9uNjZ2AgNeaLnBglUKgqaU7w+cGqZs1OchRgEC0nmvSCpteulLiupfcgeMQMbDu11ac8LofyPeSZ35S3mF2kIeseOFguCf7ep78vgeQz4Cm/28DQ+fqekpfnTnNClI5cjUN203gRUhSIsMuYZbjqyu5cWIIlmUWpEEQrUxwDg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SqN0cyBK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SqN0cyBK"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9265A98;
	Tue,  4 Feb 2025 16:48:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738684110;
	bh=nrMeiH7UVExN4XSEnV6FIGYBUi4IDz1jBq3iVTNjCUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SqN0cyBKXmDk3OlLSPfc0SlRrSqWSSHxFmVH/tCw6I+VUjA0u9EcWJ54o+IUXicJP
	 ibY3s2VPFIOmSQxvdnhU64jyZbYsdbzDRh18YRdQ8w9jVfy4hf9stHefprhTfqX6SC
	 4ON5B+zs68hM9QnWxpAuSNVlu7O87120ZzSROyJc=
Date: Tue, 4 Feb 2025 17:49:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, corbet@lwn.net,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
Message-ID: <20250204154938.GF22963@pendragon.ideasonboard.com>
References: <20250203174626.1131225-1-kuba@kernel.org>
 <CAMuHMdXXNkpWjkKvMLd-MF=npzqJXMtnXkaba60JY7hCzyjz7g@mail.gmail.com>
 <20250204071834.78e0ffb1@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204071834.78e0ffb1@kernel.org>

On Tue, Feb 04, 2025 at 07:18:34AM -0800, Jakub Kicinski wrote:
> On Tue, 4 Feb 2025 08:59:28 +0100 Geert Uytterhoeven wrote:
> > You probably also want to document the other popular[*] solution:
> > 
> >     From: Patch Author <author+company@example.com>
> > 
> > [*] Statistics for v6.0..v6.14-rc1:
> >       - "(Company): 3430
> >       - "+company": 2871
> 
> Hm, I mostly associate that format with MAINTAINERS entries where
> people want email classification. But you're right there are some 
> uses, only 3 of them look like companies, tho.
> 
> $ git log --format='%ae' v6.0..v6.14-rc1 | grep '+' | sed -e 's/.*+\(.*\)@.*/\1/' | sort | uniq -c | awk '{if ($1 > 5) print;}'
>      18 huawei
>     464 kernel
>      46 lin
>     742 linaro
>       8 publicgit
>    1646 renesas
> 
> $ git log --format='%an' v6.0..v6.14-rc1 | sed -n 's/.*(\(.*\))/\1/p' | sort | uniq -c | awk '{if ($1 > 5) print;}'
>     177 AMD
>     210 Arm
>      29 Dent Project
>      37 eBPF Foundation
>     547 Google
>      13 Hanghong Ma
>     132 IBM
>      46 Intel
>      38 Microsoft
>      18 Ming Qiang Wu
>     155 NGI0
>      26 NXP OSS
>    1487 Oracle
>      19 OSS
>       7 Som
>      70 Sony
>     353 SUSE
>       9 tencent
>      24 VMware
>       8 辛安文

Note that some of those are name components:

      7 Somashekhar(Som) <somashekhar.puttagangaiah@intel.com>
     13 Leo (Hanghong) Ma <hanghong.ma@amd.com>
     18 David (Ming Qiang) Wu <David.Wu3@amd.com>

In two cases the component between parentheses is in the middle of the
name, so it can be differentiated from a company name, but that's not
always the case. Automatic parsing of author names (or other tags) is
ambiguous.

We also have cases where the additional text refers to a team within a
company, already properly identified by the e-mail address:

     15 Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
     26 Radu Pirea (NXP OSS) <radu-nicolae.pirea@oss.nxp.com>

Or apparently project or customer names for consulting companies:

     29 Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
     34 Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>

The other cases correctly refer to companeis, for contributors using
other email addresses:

      14 linux.dev
      41 zytor.com
      47 joelfernandes.org
     176 alien8.de
     243 gmail.com
     333 goodmis.org
     454 armlinux.org.uk
     918 infradead.org
    1007 kernel.org

Do we want to only document existing practices, or also tell which
one(s) should be favoured ?

-- 
Regards,

Laurent Pinchart
