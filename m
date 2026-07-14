Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CAA3CCFB2;
	Tue, 14 Jul 2026 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031486; cv=none; b=iO5YR5wukufWnaQpxm1+K9ZtUZjKeuwoYv5qyJxZgbduskdbayhNAOYAgJbwn4LuJllEMBK4yfXhiHPNltlgPHPf+ESEbG7k6xSlJbOpdqQL8FFvgaLWHGZceJ8wFcbC91hVdGjnmEVO6GjQA0N4xZ/FWRbWo+eSdGpP3i9bU+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031486; c=relaxed/simple;
	bh=DWbsCOq4gIgWWNhkiKHns/cZmQiiGdhtiM8bhetUWpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4mooP9sMegpPgY6/2wgfMQ8uf7tlKKDZuEwwYd7Pcv0ot5FAZSShzibJdurBzVvs+hclRLPr4ML65DKCzVrY2NBufBbHPmbFN55WAswY6pUPRpST6nVDBJASZhpSjR03OrutawsV+4W5P29IMbk3LJVaRDRLDeyYr0axvVE7SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k+U8mivN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k+U8mivN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32F81F000E9;
	Tue, 14 Jul 2026 12:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784031484;
	bh=uMxTAnWITw0diNJLzXMtM8AWFtJu9rIvHeYasldDwbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k+U8mivNU5XrRUhd97edQErsK5sMARl5XijdHgoT8dLQu+vkzXj+9hXZ5AIoBYsYJ
	 eLoZo16jDZF1bni/d/wXZ0QYTkeOWVVAoXDIr6Wj0I0uvkfeuQ5FcdVJZ+fWfbml8M
	 1OzEMwH/Zkr8dP4lpi0AnqzmfWWlu2XdtnGRx1lE=
Date: Tue, 14 Jul 2026 14:17:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Spuntik <spuntik1205@gmail.com>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH] Add SECURITY.md to redirect GitHub users to official
 security channels
Message-ID: <2026071415-washboard-seventeen-c7bf@gregkh>
References: <CAA7kybvhDafxcsOv-JTeB5NfqBgiTivp671yMsnHeS8T8MOO6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA7kybvhDafxcsOv-JTeB5NfqBgiTivp671yMsnHeS8T8MOO6Q@mail.gmail.com>

On Tue, Jul 14, 2026 at 12:46:41PM +0200, Spuntik wrote:
> >From 9b140a7e28c8480ab51bc5441c4d40fa5e5a4e90 Mon Sep 17 00:00:00 2001
> From: spuntik1205 <spuntik1205@gmail.com>
> Date: Tue, 14 Jul 2026 12:22:32 +0200
> Subject: [PATCH] Add SECURITY.md to redirect GitHub users to official
> security channels
> 
> GitHub natively supports a `SECURITY.md` file in the root of the
> repository. When this file is present, GitHub automatically
> creates a "Security" tab for the repo and displays a prominent link to
> this policy whenever a user attempts to open a new issue.
> 
> Since the Linux kernel mirror on GitHub receives a lot of traffic from
> users who may not be familiar with the kernel's
> mailing-list workflow, they might incorrectly attempt to report
> security vulnerabilities through public GitHub channels.
> 
> This PR adds a standard `SECURITY.md` file that:
> 1. Explicitly asks users not to report vulnerabilities on GitHub.

Do people actually do this?  If so, that should be disabled as no one
looks at it.

> 2. Directs them to the official `security@kernel.org` mailing list.

No, you need to read the security documentation which tells you how to
do this.

> 3. Links directly to the official `security-bugs.rst` documentation on
> kernel.org for proper reporting procedures.

That's better, but really, step 2 is not correct.

> While I understand the kernel does not use GitHub for development,
> adding this file will help intercept confused GitHub users
> and redirect them to the proper kernel security workflows.
> ---

No signed-off-by or real authorship information?

And no, we don't add files for github only, sorry.

>  SECURITY.md | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 SECURITY.md
> 
> diff --git a/SECURITY.md b/SECURITY.md
> new file mode 100644
> index 000000000000..80b0b46279f6
> --- /dev/null
> +++ b/SECURITY.md
> @@ -0,0 +1,19 @@
> +# Security Policy
> +
> +## Supported Versions
> +
> +The Linux kernel maintains several active branches. The mainline
> kernel, stable kernels, and longterm maintenance (LTS) kernels are
> currently supported with security updates.
> +
> +Please refer to the [active kernel
> releases](https://www.kernel.org/category/releases.html) on kernel.org
> to see which versions are currently receiving security updates.
> +
> +## Reporting a Vulnerability
> +
> +**Please do not report security vulnerabilities through public GitHub issues.**
> +
> +If you believe you have found a security vulnerability in the Linux
> kernel, please report it to the Linux kernel security team.
> +
> +1. **Email the Security Team:** Send an email to `security@kernel.org`.
> +2. **Read the Documentation:** For detailed instructions on what to
> include in your report, acceptable disclosure timelines, and how the
> kernel team handles security bugs, please read the official [Security
> Bugs Documentation](https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html).
> +3. **Hardware Vulnerabilities:** If you are reporting a hardware
> vulnerability that affects the kernel, please refer to the specific
> guidelines for [Hardware
> vulnerabilities](https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html)
> and contact the hardware security team at
> `hardware-security@kernel.org` if appropriate.
> +
> +The security team will review your report and work with you and the
> relevant subsystem maintainers to develop and release a fix. You can
> typically expect an initial response within a few days.

Really?  We don't provide any QoS guarantees :)

thanks,

greg k-h
