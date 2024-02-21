Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A21A3F8DE;
	Wed, 21 Feb 2024 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708514645; cv=none; b=CCBEwW3POjzNtWA1CFKA9od7wFX7AA9c7l2n1+dczOtqV6pmPcRNHLMpIhzBFy6UGx8sXN2Z+c9dwkKRJtZ5BwzcMu/E2jpcMVn4ZrzR4x2IdcZM/AYzlEMnYtLPhty87uAzgd4FgXZeXDrNW6cqqhSzQsEdgj227mpvjnCQtJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708514645; c=relaxed/simple;
	bh=kOkArKg6pdV4IsD7Lly5jhFzI0UqXbKBvf38KaMwvEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0QwAZblKcVATIEWGI8D5+fpq6YYdjcCGE7oHndEwxmzeYUESXXYmufJQTaHGKu3MpEIVUsEicwj2UE2Do9BiIksNXRYVVDNE+1gFIpVDumYckm133+0Q6kOUol9o4w1CVulhFPSyNhi+uwXMgcxDDiS6YR19YpL5/kx8kk23y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dM+r3/9W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dM+r3/9W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A61C433F1;
	Wed, 21 Feb 2024 11:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708514645;
	bh=kOkArKg6pdV4IsD7Lly5jhFzI0UqXbKBvf38KaMwvEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dM+r3/9WkZkYNIUd6I3XP6bHCIMUXNNBBa/bnCWoO3kFfg4IOL+cmbhGOOxB7cORz
	 6agfjidgthGbMONvDZYNMghyX0ylDgfqXnyzBSib8LHCdr7+YRd3aCY6rNmiQscb1q
	 33vSpdSdUk5ijQyn+/3jKJXCJiinvKWv1qpaVMgA=
Date: Wed, 21 Feb 2024 12:24:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org,
	workflows@vger.kernel.org, Security Officers <security@kernel.org>
Subject: Re: CVE-2023-52435: net: prevent mss overflow in skb_segment()
Message-ID: <2024022131-fang-rope-a629@gregkh>
References: <2024022048-rind-huff-b1a2@gregkh>
 <5581ce8a-e669-465b-ab13-00e1c8ca91f3@suse.cz>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5581ce8a-e669-465b-ab13-00e1c8ca91f3@suse.cz>

On Wed, Feb 21, 2024 at 10:30:52AM +0100, Vlastimil Babka wrote:
> On 2/20/24 19:06, Greg Kroah-Hartman wrote:
> > The Linux kernel CVE team has assigned CVE-2023-52435 to this issue.
> > 
> > 
> > Affected and fixed versions
> > ===========================
> > 
> > 	Issue introduced in 4.8 with commit 3953c46c3ac7 and fixed in 6.6.11 with commit 95b3904a261a
> > 	Issue introduced in 4.8 with commit 3953c46c3ac7 and fixed in 6.7 with commit 23d05d563b7e
> 
> Hello,
> 
> what is the advice for stable users of versions between 4.19 and 6.1? Are
> they not affected?

They are affected, as the wording here states (and as the json values in
the CVE entry itself show in great detail if you want a machine-parsable
format to use)

The fixes for the other branches are in the next round of -rc kernels to
go out in an hour or so.

thanks,

greg k-h
