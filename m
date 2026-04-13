Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F39230AD15;
	Mon, 13 Apr 2026 23:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776121717; cv=none; b=apbjhOLK3tuTdDNfYuNtw55aADJ/FKr60HeViu8lgC/FziS4vhjn7jgVYZCkft5Js9bXpLpYDkGjEzGWXOIVZbpCJobCUsDjRnu9tKE0Rlu19wvHSlGDA3C9WpKAkRIuhpYAs9bs6AxRguPctaYfFv/IRqcsnO8lF0AQsCqBkog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776121717; c=relaxed/simple;
	bh=39e0gGRU0k/iBs93PtcYeN6MruO9V99ZkbnHHHcMg6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CGK3IF1iApR/DqpEZFoayMI+QwJovdw2tEAMxiH6v28iseqrpPUVKkIn+/9RFKUrXc2CUvIKLvaKU6sZsjXzq+eZlo3pn+OyXf5UDUL6uKaF32bZ9unpfR7d1KM/rYugI2slFhW6vH+McJ4+Wafs8KQ+gR4qIhn17TmbJgzoe2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GAbPHk07; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GAbPHk07"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=RtM4IZa3iXlYmVbIxW2x/QgOJcJwQXdcK2ETmvjNGgY=; b=GAbPHk07jH22QvlLDkOPaIA4Lz
	JMfWQQ14wmijK8q2hn1QJejDpOYywAz6YeDo1dAovXlXEAZA1ysi2H3/RzwZ9lnC6mCHm0arU7/Ao
	VUWEuwSyK/Om03tdn8ESPnMwijm4MZ6J+LnwIKnpYWk1W4edZOAFshkgjFFhh9d+NDMZSXC1eExy6
	cxUnDWX269M93SMkcW7UpQ1+qfuLUpWvlGV7is6wgLfM0+gCShtj1E3a/b66jvWZosyl4dG+05N9s
	/INIppSfkSMQVLdrQ3qzOwohJbzLsF/c7rQnayq0c8N8+e/5PbZ4j6CPGTSL0mfenn9jOOIgt6P0h
	4o2xnWoA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCQOP-0000000GTCq-2NVB;
	Mon, 13 Apr 2026 23:08:33 +0000
Message-ID: <12ff4c51-76ee-40aa-8fbb-30d972c2a8cc@infradead.org>
Date: Mon, 13 Apr 2026 16:08:33 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: maintainer profiles
To: Dan Williams <djbw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Kernel Workflows <workflows@vger.kernel.org>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
 <87wlyawum7.fsf@trenco.lwn.net> <69dd6299440be_147c801005b@djbw-dev.notmuch>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <69dd6299440be_147c801005b@djbw-dev.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/13/26 2:39 PM, Dan Williams wrote:
> Jonathan Corbet wrote:
>> Randy Dunlap <rdunlap@infradead.org> writes:
>>
>>> Hi,
>>>
>>> Is there supposed to be a difference (or distinction) in the contents of
>>>
>>> Documentation/process/maintainer-handbooks.rst
>>> and
>>> Documentation/maintainer/maintainer-entry-profile.rst
>>> ?
>>>
>>> Can they be combined into one location?
>>
>> Late to the party, sorry ... the original idea, I believe, was that
>> maintainer-handbooks.rst would be for developers looking for a guidebook
>> for a specific subsystem, while maintainer-entry-profile.rst was about
>> how maintainers themselves should write their subsystem guide.
>> Doubtless things have drifted since then...  But the intended audiences
>> were different, so it might be good to think about bringing them back
>> into focus.
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
> 
> Note the problem goes both ways, there are P: entries not in the
> combined handbook list, like the Security subsystem, and there are
> handbook entries without a P:, like the Tip tree.

I had not (and have not) checked on the P: entries.
However, this patch is close to where I already was, but it (and my
patch) causes some problems. (I dropped the duplicate
maintainer-soc-clean-dts entry.)

E.g., maintainer-handbooks uses :numbered:, but the Media and XFS
entries are already numbered, so Sphinx complains about that.
I think that numbering isn't needed, so I tried dropping that,
but the Media and XFS entries are still numbered, so it looks
messy, but that may be OK (better) than 2 mixed lists.

I'm not finding a satisfactory answer here (yet).


diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst> index 6020d188e13d..58e2af333692 100644
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
> 
> 

-- 
~Randy

